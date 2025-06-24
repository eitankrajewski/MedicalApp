//
//  SettingsView.swift
//  MedicalApp
//
//  Created by Eitan Krajewski on 6/22/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.cyan.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Username")
                Text("Registered doctor")
            }
            .frame(width: 300, height: 500)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
        }
    }
}

#Preview {
    SettingsView()
}
