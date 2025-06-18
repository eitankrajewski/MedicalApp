//
//  ContentView.swift
//  MedicalApp
//
//  Created by Eitan Krajewski on 6/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var oauthFlow = OAuthFlow()
    
    var body: some View {
        
        VStack() {
            HStack() {
                VStack() {
                    Text("Hello, [NAME]")
                        .font(.system(size: 35, design: .serif))
                    Text("How are you feeling?")
                        .font(.system(.title3, design: .serif))
                }
                .frame(minWidth: 150, maxWidth: 500, alignment: .leading)
//                .background(.red)
                .padding(10)
                
                
                Circle()
                    .frame(width: 50)
                
            }
            .padding([.top], 50)
            .padding([.leading, .trailing], 10)
            
            Rectangle()
                .frame(width: 350, height: 200)
                .cornerRadius(25)
                .padding([.top], 15)
                .shadow(color: .gray, radius: 5, x: 5, y: 5)
            
            Spacer()
        }
        
//        Button("yuh") {
//            oauthFlow.startOAuthFlow()
//        }
//        Button("Press Here to View Sleep") {
//            oauthFlow.getSleep()
//        }
//        
//        Button("Press Here to View Cycle") {
//            oauthFlow.getCycle()
//        }
        
    }
}
    

    #Preview {
        ContentView()
    }
