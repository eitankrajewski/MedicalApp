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
        
        TabView {
            ScrollView {
                VStack(spacing: 30) {
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
                    
                    HStack(spacing: 30) {
                        Button {
                            
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
                                .background(Color(.red))
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
                                .background(Color(.red))
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
                        Rectangle()
                            .frame(width: 350, height: 200)
                            .cornerRadius(25)
                            .padding([.top], 15)
                            .shadow(color: .gray, radius: 5, x: 5, y: 5)
                        
                        Button() {
                            
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
                    
                    Spacer()
                    
                    
                }
                
                
            }
            .toolbarBackground(.red, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .tabItem {
                Image(systemName: "house")
                Text("Hello")
            }
            
            Text("Yes")
            .tabItem {
                Image(systemName: "arrow.up.heart")
                Text("Upload Symptoms")
            }
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
