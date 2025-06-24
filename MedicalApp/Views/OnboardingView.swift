//
//  OnboardingView.swift
//  MedicalApp
//
//  Created by Eitan Krajewski on 6/24/25.
//

import SwiftUI

struct OnboardingView: View {
    @State var currentView = 0
    @State  var name = ""
    var body: some View {
        if (currentView == 0) {
            LandingView()
        } else if (currentView == 1) {
            RegistrationView()
                .transition(.scale)
        }
    }
    
    func LandingView() -> some View {
        ZStack{
            LinearGradient(colors: [Color.cyan.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            Image(systemName: "star.fill")
                .font(.system(size: 350))
                .foregroundColor(.white.opacity(0.3))
                .offset(x: 60, y: 300)
                .rotationEffect(.degrees(30))
            
            Image(systemName: "star.fill")
                .font(.system(size: 350))
                .foregroundColor(.white.opacity(0.3))
                .offset(x: -60, y: -300)
                .rotationEffect(.degrees(30))
            
            VStack(spacing: 30) {
                Text("Welcome to a safer future.")
                    .font(.system(size: 35, design: .serif))
                    .multilineTextAlignment(.center)
                
                Button {
                    currentView += 1
                } label: {
                    Text("Let's get started!")
                }
                .background(.ultraThinMaterial)
            }
            .frame(width: 300, height: 500)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
        }
    }
    
    func RegistrationView() -> some View {
        ZStack{
            LinearGradient(colors: [Color.cyan.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            Image(systemName: "star.fill")
                .font(.system(size: 350))
                .foregroundColor(.white.opacity(0.3))
                .offset(x: 60, y: 300)
                .rotationEffect(.degrees(30))
            
            Image(systemName: "star.fill")
                .font(.system(size: 350))
                .foregroundColor(.white.opacity(0.3))
                .offset(x: -60, y: -300)
                .rotationEffect(.degrees(30))
            
            VStack(spacing: 30) {
                Text("First, tell us your name.")
                    .font(.system(size: 35, design: .serif))
                    .multilineTextAlignment(.center)
                
                TextField("Enter name", text: $name)
                    .font(.system(size: 20))
                    .frame(width: 150)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .padding(50)
                    
            }
            .frame(width: 300, height: 500)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
        }
    }
}

#Preview {
    OnboardingView()
}
