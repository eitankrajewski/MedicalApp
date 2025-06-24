//
//  OAuthFlow.swift
//  MedicalApp
//
//  Created by Eitan Krajewski on 6/11/25.
//



import AuthenticationServices
import WebKit

class OAuthFlow: NSObject, ASWebAuthenticationPresentationContextProviding, ObservableObject {
    @Published var authCode: String = ""
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return UIApplication.shared.windows.first { $0.isKeyWindow } ?? ASPresentationAnchor()
    }
    
    
    private var session: ASWebAuthenticationSession?
    
    func startOAuthFlow() {
        let clientId = "c16753c9-e854-4475-a4ff-f3ee28961d2e"
        let redirectURI = "myapp://oauth-callback"
        var components = URLComponents(string: "https://api.prod.whoop.com/oauth/oauth2/auth")!
        components.queryItems = [
            URLQueryItem(name: "client_id", value: clientId),
            URLQueryItem(name: "redirect_uri", value: redirectURI),
            URLQueryItem(name: "response_type", value: "code"),
            URLQueryItem(name: "scope", value: "offline read:recovery read:sleep read:cycles read:profile read:body_measurement"),
            URLQueryItem(name: "state", value: "pleaseworkpleaseeee")
        ]
        
        let authURL = components.url!
        print("Auth URL: \(authURL)")
        
        session = ASWebAuthenticationSession(
            url: authURL,
            callbackURLScheme: "myapp"
        ) { callbackURL, error in
            guard
                error == nil,
                let callbackURL = callbackURL,
                let queryItems = URLComponents(string: callbackURL.absoluteString)?.queryItems,
                let code = queryItems.first(where: { $0.name == "code"})?.value
            else {
                print("OAuth failed: \(error?.localizedDescription ?? "Unknown error")")
                print(callbackURL)
                return
            }
            
            print("Auth Code: \(code)")
            self.getToken(code: code)
        }
        
        session?.presentationContextProvider = self
        session?.start()
    }
    
    private func somethingFailed() -> Bool {
        return false
    }
    
    private func getToken(code: String) {
        let tokenURL = URL(string: "https://api.prod.whoop.com/oauth/oauth2/token")!
        var request = URLRequest(url: tokenURL)
        request.httpMethod = "POST"
        let bodyParams = [
            "client_id": "c16753c9-e854-4475-a4ff-f3ee28961d2e",
            "client_secret": "b6c43ced74cf0f0da3551ccde125e166e0f2ebae6640a25c84707496db1b7b96",
            "code": code,
            "grant_type": "authorization_code",
            "redirect_uri": "myapp://oauth-callback"
        ]
        request.httpBody = bodyParams
            .map { "\($0.key)=\($0.value)"}
            .joined(separator: "&")
            .data(using: .utf8)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard
                let data = data,
                let tokenResponse = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                let accessToken = tokenResponse["access_token"] as? String,
                let refreshToken = tokenResponse["refresh_token"] as? String
            else {
                print("Token exchange failed")
                return
            }
            
            print("Access token: \(accessToken)")
            print(tokenResponse)
            print("Refresh token: \(refreshToken)")
            
            let defaults = UserDefaults.standard
            defaults.set(accessToken, forKey: DefaultKeys.accessToken)
            defaults.set(refreshToken, forKey: DefaultKeys.refreshToken)
            MyLocalStorage.refreshTokenGetOrSet = refreshToken
            print("\(MyLocalStorage.refreshTokenGetOrSet)")
            
            
            
        }.resume()
        
        
    }
    
    func getSleep() {
        
        let defaults = UserDefaults.standard
        let accessToken = defaults.string(forKey: DefaultKeys.accessToken)
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.prod.whoop.com"
        components.path = "/developer/v1/activity/sleep"
        
        components.queryItems = [
            URLQueryItem(name: "limit", value: "1")
        ]
        
        
        print(components)
        
        func getCurrentSleep() {
            
            let url = components.url!
            
            var sleepResponse = URLRequest(url: url)
            
            sleepResponse.addValue("Bearer \(accessToken!)", forHTTPHeaderField: "Authorization")
            
            let task = URLSession.shared.dataTask(with: sleepResponse) {(data, response, error) in
                guard let data = data else {return}
                print(String(data: data, encoding: .utf8)!)
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let decodedData = try decoder.decode(RecordsSleep.self, from: data)
                    let sleepScore = String(decodedData.records[0].score.sleepPerformancePercentage)
                    let respiratoryRate = String(decodedData.records[0].score.respiratoryRate)
                    defaults.set(sleepScore, forKey: DefaultKeys.sleepScore)
                    defaults.set(respiratoryRate, forKey: DefaultKeys.respiratoryRate)
                    print(sleepScore, respiratoryRate)
                }
                catch {
                    print("Error in parsing!")
                    //                    throw WhoopError.invalidData
                }
                
                print()
                
            }
            
            
            
            task.resume()
            
        }
        getCurrentSleep()
    }
        
    func getRecovery() {
        
        let defaults = UserDefaults.standard
        let accessToken = defaults.string(forKey: DefaultKeys.accessToken)
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.prod.whoop.com"
        components.path = "/developer/v1/activity/recovery"
        
        components.queryItems = [
            URLQueryItem(name: "limit", value: "1")
        ]
        
        
        print(components)
        
        func getCurrentRecovery() {
            
            let url = components.url!
            
            var recoveryResponse = URLRequest(url: url)
            
            recoveryResponse.addValue("Bearer \(accessToken!)", forHTTPHeaderField: "Authorization")
            
            let task = URLSession.shared.dataTask(with: recoveryResponse) {(data, response, error) in
                guard let data = data else {return}
                print(String(data: data, encoding: .utf8)!)
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let decodedData = try decoder.decode(RecordsRecovery.self, from: data)
                    let recoveryScore = String(decodedData.records[0].score.recoveryScore)
                    let restingHeartRate = String(decodedData.records[0].score.restingHeartRate)
                    let hrvRmssdMilli = String(decodedData.records[0].score.hrvRmssdMilli)
                    let spo2Percentage = String(decodedData.records[0].score.spo2Percentage)
                    let skinTempCelsius = String(decodedData.records[0].score.skinTempCelsius)
                    defaults.set(recoveryScore, forKey: DefaultKeys.sleepScore)
                    defaults.set(restingHeartRate, forKey: DefaultKeys.respiratoryRate)
                    defaults.set(hrvRmssdMilli, forKey: DefaultKeys.hrvRmssdMilli)
                    defaults.set(spo2Percentage, forKey: DefaultKeys.spo2Percentage)
                    defaults.set(skinTempCelsius, forKey: DefaultKeys.skinTempCelsius)
                    print(recoveryScore, restingHeartRate, hrvRmssdMilli, spo2Percentage, skinTempCelsius)
                }
                catch {
                    print("Error in parsing!")
                    //                    throw WhoopError.invalidData
                }
                
                print()
                
            }
            
            
            
            task.resume()
            
        }
        getCurrentRecovery()
    }
            
    func getCycle() {
                
                let defaults = UserDefaults.standard
                let accessToken = defaults.string(forKey: DefaultKeys.accessToken)
                
                var components = URLComponents()
                components.scheme = "https"
                components.host = "api.prod.whoop.com"
                components.path = "/developer/v1/cycle"
                
                components.queryItems = [
                    URLQueryItem(name: "limit", value: "1")
                ]
                
                
                print(components)
                
                func getCurrentCycle() {
                    
                    let url = components.url!
                    
                    var cycleResponse = URLRequest(url: url)
                    
                    cycleResponse.addValue("Bearer \(accessToken!)", forHTTPHeaderField: "Authorization")
                    
                    let task = URLSession.shared.dataTask(with: cycleResponse) {(data, response, error) in
                        guard let data = data else {return}
                        print(String(data: data, encoding: .utf8)!)
                        do {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let decodedData = try decoder.decode(RecordsCycle.self, from: data)
                            print(decodedData)
                            let strain = String(decodedData.records[0].score.strain)
                            let averageHeartRate = String(decodedData.records[0].score.averageHeartRate)
                            let maxHeartRate = String(decodedData.records[0].score.maxHeartRate)
                            defaults.set(strain, forKey: DefaultKeys.strain)
                            defaults.set(averageHeartRate, forKey: DefaultKeys.averageHeartRate)
                            defaults.set(maxHeartRate, forKey: DefaultKeys.maxHeartRate)

                            
                        }
                        catch {
                            print("Error in parsing!")
                            //                    throw WhoopError.invalidData
                        }
                        
                        print()
                        
                    }
                    
                    
                    
                    task.resume()
                    
                }
            getCurrentCycle()
            
        }
        
    }
    
    struct RecordsCycle: Codable {
        let records: [Cycle]
        let nextToken: String
    }
        
    struct Cycle: Codable {
        let id: Int
        let userId: Int
        let createdAt: String
        let updatedAt: String
        let start: String
        let end: String?
        let timezoneOffset: String
        let scoreState: String
        let score: CycleScore
    }
        
    struct CycleScore: Codable {
        let strain: Float
        let kilojoule: Float
        let averageHeartRate: Int
        let maxHeartRate: Int
    }
    
    struct RecordsRecovery: Codable {
        let records: [Recovery]
        let nextToken: String
    }
    
    struct Recovery: Codable {
        let cycleId: Int
        let sleepId: Int
        let userId: Int
        let createdAt: String
        let updatedAt: String
        let scoredState: String
        let score: RecoveryScore
    }
    
    struct RecoveryScore: Codable {
        let userCalibrating: Bool
        let recoveryScore: Int
        let restingHeartRate: Int
        let hrvRmssdMilli: Float
        let spo2Percentage: Float
        let skinTempCelsius: Float
    }
    
    struct RecordsSleep: Codable {
        let records: [Sleep]
        let nextToken: String
    }
    
    struct Sleep: Codable {
        let id: Int
        let userId: Int
        let createdAt: String
        let updatedAt: String
        let start: String
        let end: String
        let timezoneOffset: String
        let nap: Bool
        let scoreState: String
        let score: SleepScore
    }
    
    struct SleepScore: Codable {
        let stageSummary: SleepStageSummary
        let sleepNeeded: SleepNeeded
        let respiratoryRate: Float
        let sleepPerformancePercentage: Float
        let sleepConsistencyPercentage: Float
        let sleepEfficiencyPercentage: Float
    }
    
    struct SleepStageSummary: Codable {
        let totalInBedTimeMilli: Int
        let totalAwakeTimeMilli: Int
        let totalNoDataTimeMilli: Int
        let totalLightSleepTimeMilli: Int
        let totalSlowWaveSleepTimeMilli: Int
        let totalRemSleepTimeMilli: Int
        let sleepCycleCount: Int
        let disturbanceCount: Int
    }
    
    struct SleepNeeded: Codable {
        let baselineMilli: Int
        let needFromSleepDebtMilli: Int
        let needFromRecentStrainMilli: Int
        let needFromRecentNapMilli: Int
    }
    
    enum WhoopError: Error {
        case invalidURL
        case invalidReponse
        case invalidData
    }
    
struct DefaultKeys {
        static let accessToken = ""
        static let refreshToken = ""
        static let decodedData = ""
        static let respiratoryRate = ""
        static let sleepScore = ""
        static let recoveryScore = ""
        static let restingHeartRate = ""
        static let hrvRmssdMilli = ""
        static let spo2Percentage = ""
        static let skinTempCelsius = ""
        static let strain = ""
        static let averageHeartRate = ""
        static let maxHeartRate = ""
    }

//class MyLocalStorage {
//    
//    static var refreshToken = ""
//    
//    public static var myValue: String {
//        
//        set {
//            UserDefaults.standard.set(newValue, forKey: refreshToken)
//        }
//        get {
//            return UserDefaults.standard.string(forKey: refreshToken) ?? "ERROR"
//        }
//    }
//}
