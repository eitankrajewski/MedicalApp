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
        
        
        GeometryReader {
            let safeArea = $0.safeAreaInsets
            
            NavigationStack {

                ScrollView {
                        
                        VStack(spacing: 30) {
                            BlurView(removeAllFilters: false)
                                .blur(radius: 10)
                                .frame(height: 50 + safeArea.top)
                                .offset(y: -50)
                                .visualEffect { view, proxy in
                                    view.offset(y: (proxy.bounds(of: .scrollView)?.minY ?? 0))
                                }
                                .zIndex(1000)
                            
                            VStack(spacing: 20){
                                HStack() {
                                    VStack() {
                                        Text("Hello, \(MyLocalStorage.patientNameGetOrSet)")
                                            .font(.system(size: 35, design: .serif))
                                        Text("How are you feeling?")
                                            .font(.system(.title3, design: .serif))
                                    }
                                    .frame(minWidth: 150, maxWidth: 500, alignment: .leading)
                                    .padding(10)
                                    .multilineTextAlignment(.center)
                                    
                                    NavigationLink {
                                        SettingsView()
                                    } label: {
                                        ZStack {
                                            Circle()
                                                .frame(width: 50)
                                            
                                            Image(systemName: "person.fill")
                                                .foregroundColor(.black)
                                                .font(.system(size: 30))
                                        }
                                            
                                    }
                                    
                                }
                                .padding([.leading, .trailing], 10)
                                
                                ZStack {
                                    
                                    
                                    VStack(alignment: .center) {
                                        Image(systemName: "bolt.heart")
                                            .symbolEffect(.pulse)
                                            .font(.system(size: 75))
                                            .padding([.top], 10)
                                        
                                        Text("The last scan from WHOOP and/or Kardia wsa sent on [THIS DAY].")
                                            .padding(10)
                                            .padding([.top], 10)
                                    }
                                    
                                    
                                    
                                    
                                }
                                .frame(width: 350, height: 200)
                                .padding([.top], 15)
                                .background(.ultraThinMaterial)
                                .cornerRadius(25)
                                .shadow(radius: 10, x: 10, y: 10)
                                
                                HStack(spacing: 30) {
                                    NavigationLink {
                                        SymptomView()
                                    } label: {
                                        ZStack {
                                            
                                            VStack() {
                                                Image(systemName: "arrow.up.heart")
                                                    .font(.system(size: 50))
                                                    .foregroundColor(.black)
                                                    .frame(width: 50, height: 50)
                                                
                                                Text("Report Symptoms")
                                                    .foregroundColor(.black)
                                                
                                            }
                                            .padding(6)
                                            .frame(width: 150, height: 150)
                                            .background(.ultraThinMaterial)
                                            .cornerRadius(25)
                                            
                                            HStack() {
                                                Circle()
                                                    .frame(width: 50, height:50)
                                                    .overlay(
                                                        Text("+")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 45))
                                                            .offset(y:-3)
                                                    )
                                                    .offset(x: -55, y: -55)
                                            }
                                        }
                                    }
                                    .shadow(radius: 10, x: 10, y: 10)
                                    
                                    Button {
                                        
                                    } label: {
                                        ZStack {
                                            
                                            VStack() {
                                                Image(systemName: "person.wave.2")
                                                    .font(.system(size: 50))
                                                    .foregroundColor(.black)
                                                    .frame(width: 50, height: 50)
                                                    .padding(5)
                                                
                                                Text("Report Health Data")
                                                    .foregroundColor(.black)
                                                
                                            }
                                            .padding(6)
                                            .frame(width: 150, height: 150)
                                            .background(.ultraThinMaterial)
                                            .cornerRadius(25)
                                            
                                            HStack() {
                                                Circle()
                                                    .frame(width: 50, height:50)
                                                    .overlay(
                                                        Text("+")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 45))
                                                            .offset(y:-3)
                                                    )
                                                    .offset(x: -55, y: -55)
                                            }
                                        }
                                    }
                                    .shadow(radius: 10, x: 10, y: 10)
                                    
                                }
                                
                                ZStack {
                                    
                                    
                                    NavigationLink {
                                        
                                    } label: {
                                        Text("View Reports")
                                            .frame(maxWidth: 150)
                                            .frame(height: 25)
                                            .foregroundColor(.black)
                                            .background(.blue)
                                            .cornerRadius(25)
                                    }
                                    
                                    .offset(y: 70)
                                }
                                .frame(width: 350, height: 200)
                                .foregroundColor(Color.black.opacity(0.1))
                                .background(.ultraThinMaterial)
                                .cornerRadius(25)
                                .padding([.top], 15)
                                
                                Spacer()
                                
                            }
                            .offset(y:-50)
                            
                           
                            
                            
                        }
                        .padding([.leading, .trailing], 20)
                        
                        
                        
                    }
                .background(LinearGradient(colors: [Color.cyan.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all))
                    
                }
            }
        }
    }

    #Preview {
        ContentView()
    }
