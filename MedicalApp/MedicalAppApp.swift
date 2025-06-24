//
//  MedicalAppApp.swift
//  MedicalApp
//
//  Created by Eitan Krajewski on 6/11/25.
//

import SwiftUI

@main
struct MedicalAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            TabView {
                ReportView()
            }
            
        }
    }
}
