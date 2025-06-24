//
//  ReportView.swift
//  MedicalApp
//
//  Created by Eitan Krajewski on 6/21/25.
//

import SwiftUI

struct ReportView: View {
    @State private var whoopData = false
    @StateObject private var oauthFlow = OAuthFlow()
    
    private var isAuthorized: Bool = (MyLocalStorage.refreshTokenGetOrSet != "")
    var body: some View {
        if(!isAuthorized) {
            authView()
        } else {
            sendView()
        }
    }
    
    func sendView() -> some View {
        
        ZStack {
            LinearGradient(colors: [Color.cyan.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .background(LinearGradient(
                    colors: [.white, .cyan],
                    startPoint: .leading,
                    endPoint: .trailing
                ))
                .foregroundColor(.white.opacity(0.3))
                .frame(width: 600, height: 100)
                .rotationEffect(.degrees(-30))
                .offset(y:300)
            
            Rectangle()
                .background(LinearGradient(
                    colors: [.white, .cyan],
                    startPoint: .leading,
                    endPoint: .trailing
                ))
                .foregroundColor(.white.opacity(0.3))
                .frame(width: 600, height: 100)
                .rotationEffect(.degrees(-30))
                .offset(y:-300)
            
            VStack(spacing: 20) {
                ScrollView {
                    Text("Please select which of the following you would like to send to your registered cardiologist:")
                        .padding([.top, .bottom], 30)
                        .padding([.leading, .trailing], 20)
                        .font(.title2)
                    VStack(alignment: .center) {
                        Text("REGISTERED CARDIOLOGIST")
                            .font(.headline)
                        Text("Dr Krajewski\nkrajewski@krajewski.com")
                    }
                    .frame(width: 250, height: 100)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .padding([.top, .bottom], 50)
                    
                    Toggle(isOn: $whoopData) {
                        Text("WHOOP Data")
                    }
                    .padding([.leading, .trailing], 20)
                    
                    Toggle(isOn: $whoopData) {
                        Text("Kardia ECG")
                    }
                    .padding([.leading, .trailing], 20)
                    
                    
                    
                }
                .frame(width: 350, height: 500)
                .background(.ultraThinMaterial)
                .cornerRadius(25)
            }
            
            
        }
    }
    
    func authView() -> some View {
        ZStack {
            LinearGradient(colors: [Color.cyan.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .background(LinearGradient(
                    colors: [.white, .cyan],
                    startPoint: .leading,
                    endPoint: .trailing
                ))
                .foregroundColor(.white.opacity(0.3))
                .frame(width: 600, height: 100)
                .rotationEffect(.degrees(-30))
                .offset(y:300)
            
            Rectangle()
                .background(LinearGradient(
                    colors: [.white, .cyan],
                    startPoint: .leading,
                    endPoint: .trailing
                ))
                .foregroundColor(.white.opacity(0.3))
                .frame(width: 600, height: 100)
                .rotationEffect(.degrees(-30))
                .offset(y:-300)
            
            VStack(spacing: 20) {
                Text("Click here to authorize")
                
                Button {
                    oauthFlow.startOAuthFlow()
                    print()
                    
                } label: {
                    Text("CLICK")
                }
//                .disabled(MyLocalStorage.myValue != "")
//                
                Button {
                    
                } label: {
                    Text("Isbuttondisabled: ")
                }
            }
            .frame(width: 350, height: 400)
            .background(.ultraThinMaterial)
            .cornerRadius(25)
            
            
        }
    }
}

#Preview {
    ReportView()
}
