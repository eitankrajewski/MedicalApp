//
//  AppDelegate.swift
//  MedicalApp
//
//  Created by Eitan Krajewski on 6/12/25.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        print(url)
        return true
    }
    
}
