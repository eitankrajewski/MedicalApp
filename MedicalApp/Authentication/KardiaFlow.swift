//
//  KardiaFlow.swift
//  MedicalApp
//
//  Created by Eitan Krajewski on 6/25/25.
//

import Foundation

class KardiaFlow {
    
    func getAPI() {
        let parameters = "email=%3Cemail_id%3E&password=%3Cpassword%3E"
        let postData =  parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://api.kardia.com/v1/apikey")!,timeoutInterval: Double.infinity)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
    }
}
