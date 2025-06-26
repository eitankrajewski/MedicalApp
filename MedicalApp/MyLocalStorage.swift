//
//  MyLocalStorage.swift
//  MedicalApp
//
//  Created by Eitan Krajewski on 6/24/25.
//

import WebKit

class MyLocalStorage {
    
    static var patientName = ""
    
    public static var patientNameGetOrSet: String {
        
        set {
            UserDefaults.standard.set(newValue, forKey: patientName)
        }
        get {
            return UserDefaults.standard.string(forKey: patientName) ?? "ERROR"
        }
    }
    
    func loadName() {
        if let savedName = UserDefaults.standard.string(forKey: MyLocalStorage.patientName) {
            MyLocalStorage.patientName = savedName
        }
    }
    
    static var doctorName = ""
    
    public static var doctorNameGetOrSet: String {
        
        set {
            UserDefaults.standard.set(newValue, forKey: doctorName)
        }
        get {
            return UserDefaults.standard.string(forKey: doctorName) ?? "ERROR"
        }
    }
    
    static var doctorEmail = ""
    
    public static var doctorEmailGetOrSet: String {
        
        set {
            UserDefaults.standard.set(newValue, forKey: doctorEmail)
        }
        get {
            return UserDefaults.standard.string(forKey: doctorEmail) ?? "ERROR"
        }
    }
    
    static var isRegistered = "false"
    
    public static var isRegisteredGetOrSet: String {
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: isRegistered)
        }
        get {
            return UserDefaults.standard.string(forKey: isRegistered) ?? "ERROR"
        }
    }
    
    static var symptomReports = [""]
    
    public static var symptomsReportsGetOrSet: [String] {
        
        set {
            UserDefaults.standard.set(newValue, forKey: "symptomReport")
        }
        get {
            return UserDefaults.standard.stringArray(forKey: "symptomReport") ?? [String]()
        }
    }
    
//    func addReport(value: SymptomReport) {
//        let newArr: [Any] = MyLocalStorage.symptomsReportsGetOrSet.append(value)
//        UserDefaults.standard.set(newValue, forKey: "symptomReport")
//    }
    
    
    static var refreshToken = ""
    
    public static var refreshTokenGetOrSet: String {
        
        set {
            UserDefaults.standard.set(newValue, forKey: refreshToken)
        }
        get {
            return UserDefaults.standard.string(forKey: refreshToken) ?? "ERROR"
        }
    }
}
