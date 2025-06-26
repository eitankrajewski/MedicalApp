//
//  SettingsView.swift
//  MedicalApp
//
//  Created by Eitan Krajewski on 6/22/25.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var patientName = MyLocalStorage.patientNameGetOrSet
    @State private var doctorName = MyLocalStorage.doctorNameGetOrSet
    @State private var doctorEmail = MyLocalStorage.doctorEmailGetOrSet
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.cyan.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10){
                Text("Settings")
                    .font(.system(size: 35, design: .serif))
                    .multilineTextAlignment(.center)
                
                HStack {
                    Text("Patient Name:")
                    Spacer()
                    Text("\(patientName)")
                }
                .padding(5)
                .background(.ultraThinMaterial)
                .cornerRadius(5)
                .padding([.leading, .trailing], 20)
                
                TextField("\(MyLocalStorage.patientNameGetOrSet)", text: $patientName)
                    .padding(20)
                    .multilineTextAlignment(.center)
                
                
                Divider()
                
                
                HStack {
                    Text("Doctor Name:")
                    Spacer()
                    Text("\(doctorName)")
                    
                }
                .padding(5)
                .background(.ultraThinMaterial)
                .cornerRadius(5)
                .padding([.leading, .trailing], 20)
                
                TextField("\(MyLocalStorage.doctorNameGetOrSet)", text: $doctorName)
                    .padding(20)
                    .multilineTextAlignment(.center)
                
                
                HStack {
                    Text("Doctor Email:")
                    Spacer()
                    Text("\(doctorEmail)")
                }
                .padding(5)
                .background(.ultraThinMaterial)
                .cornerRadius(5)
                .padding([.leading, .trailing], 20)
                
                TextField("\(MyLocalStorage.patientNameGetOrSet)", text: $doctorEmail)
                    .padding(20)
                    .multilineTextAlignment(.center)
                
                Button {
                    

                    MyLocalStorage.patientNameGetOrSet = patientName
                    print(MyLocalStorage.patientNameGetOrSet)
                    MyLocalStorage.doctorNameGetOrSet = doctorName
                    print(MyLocalStorage.doctorNameGetOrSet)
                    MyLocalStorage.doctorEmailGetOrSet = doctorEmail
                    print(MyLocalStorage.doctorEmailGetOrSet)
                } label: {
                    Text("Submit")
                        .frame(width: 200)
                        .font(.system(size: 30))
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                }
                
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
