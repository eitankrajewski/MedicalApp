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
            
            NavigationView {
                TabView {
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            BlurView(removeAllFilters: false)
                                .blur(radius: 10)
                                .frame(height: 50 + safeArea.top)
                                .visualEffect { view, proxy in
                                    view.offset(y: (proxy.bounds(of: .scrollView)?.minY ?? 0))
                                }
                                .zIndex(1000)
                            
                            HStack() {
                                VStack() {
                                    Text("Hello, [NAME]")
                                        .font(.system(size: 35, design: .serif))
                                    Text("How are you feeling?")
                                        .font(.system(.title3, design: .serif))
                                }
                                .frame(minWidth: 150, maxWidth: 500, alignment: .leading)
                                .padding(10)
                                
                                NavigationLink {
                                    SymptomView()
                                } label: {
                                    Circle()
                                        .frame(width: 50)
                                }
                                
                            }
                            .padding([.leading, .trailing], 10)
                            
                            ZStack {
                                
                                
                                VStack(alignment: .center) {
                                    Image(systemName: "bolt.heart")
                                        .symbolEffect(.pulse)
                                        .font(.system(size: 50))
                                        .padding([.top], 10)
                                    
                                    Text("The last scan from WHOOP and/or Kardia wsa sent on [THIS DAY].")
                                        .padding(10)
                                        .padding([.top], 20)
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
                        .padding([.leading, .trailing], 20)
                        
                        
                    }
                    .background(Color.cyan.opacity(0.7))
                    .ignoresSafeArea(.container, edges: .top)
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(.ultraThinMaterial, for: .tabBar)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Hello")
                    }
                    
                    SymptomView()
                        .tabItem {
                            Image(systemName: "arrow.up.heart")
                            Text("Upload Symptoms")
                        }
                    
                }
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

//extension ContentView {
//    func blurScroll(_ blur: CGFloat) -> some View {
//        modifier(ScrollBlur(blur: blur))
//    }
//}
//
//private struct ScrollOffsetPreferenceKey: PreferenceKey {
//    
//    static var defaultValue: CGPoint = .zero
//    
//    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) { }
//    
//}

//private struct ScrollBlur: ViewModifier {
//    
//    let spaceName = ""
//    let blur: CGFloat
//    
//    @State private var scrollPosition: CGPoint = .zero
//    
//    let gradient = LinearGradient(stops: [
//        .init(color: .white, location: 0.10),
//        .init(color: .clear, location: 0.25)],
//                                  startPoint: .bottom,
//                                  endPoint: .top)
//    
//    
//    func body(content: Content) -> some View {
//        GeometryReader { geo in
//            ScrollView(.vertical) {
//                ZStack(alignment: .top) {
//                    content
//                    
//                    content
//                        .blur(radius: blur)
//                        .frame(height: geo.size.height, alignment: .top)
//                        .mask(gradient
//                            .frame(height: geo.size.height)
//                            .offset(y: -scrollPosition.y)
//                        )
//                }
//                
//                .background(GeometryReader { geo in
//                    Color.clear
//                        .preference(key: ScrollOffsetPreferenceKey.self,
//                                    value: geo.frame(in: .named(spaceName)).origin)
//                })
//                
//                .onPreferenceChange(
//                    ScrollOffsetPreferenceKey.self) { value in
//                        self.scrollPosition = value
//                    }
//            }
//            .coordinateSpace(name: spaceName)
//        }
//    }
//}
    

    #Preview {
        ContentView()
    }
