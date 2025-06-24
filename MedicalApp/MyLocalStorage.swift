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
