//
//  SymptomView.swift
//  MedicalApp
//
//  Created by Eitan Krajewski on 6/20/25.
//

import SwiftUI

struct SymptomView: View {
    @State private var progress = 0.0
    @State private var feeling = 0.0
    @State private var isEditing = false
    @State private var symptoms = ""
    @State private var recurrent = false
    @State private var lastComments = ""
    var body: some View {
        
        
        
        ZStack {
            ProgressView(value: progress) {
                Text("Progress: \(Int(progress))")
            }
            .progressViewStyle(CustomProgressViewStyle())
            .offset(y:-350)
            .zIndex(100000)
            
            LinearGradient(colors: [Color.cyan.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            
            
            
            TabView {
                VStack(alignment: .center) {
                    Spacer()
                    Text("In a few words, describe how or what you are feeling:")
                        .font(.system(size: 27, design: .serif))
                    
                    Spacer()
                    
                    TextField(
                        "Heart palpitations, shortness of breath...",
                        text: $symptoms
                    )
                    .padding([.leading, .trailing])
                    .frame(maxWidth: .infinity)
                    .frame(height: 30)
                    .background(.ultraThinMaterial)
                    .shadow(radius: 2, x: 2, y: 2)
                    .cornerRadius(10)
                    
                    Spacer()
                    Spacer()
                }
                .padding(20)
                .frame(width: 350, height: 500)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .shadow(color: .white.opacity(0.5), radius: 5, y: 5)
                
                VStack {
                    Spacer()
                    Text("Now, please indicate which level of discomfort you are experiencing.")
                        .font(.system(size: 27, design: .serif))
                    Spacer()
                    Spacer()
                    Slider(
                        value: $feeling,
                        in: 0...100,
                        onEditingChanged: { editing in
                        isEditing = editing
                        }
                    )
                    .padding(10)
                    Text("You have indicated ~\(Int(feeling))")
                        .font(.system(size: 16, design: .serif))
                    
                    Spacer()
                }
                .padding(20)
                .frame(width: 350, height: 500)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .shadow(color: .white.opacity(0.5), radius: 5, y: 5)
                
                VStack {
                    Spacer()
                    Text("Lastly, please indicate whether this is a recurrent symptom or not.")
                        .font(.system(size: 27, design: .serif))
                    Spacer()
                    Spacer()
                    Toggle("Recurrent symptoms", isOn: $recurrent)
                    .padding(10)
                    
                    VStack(alignment: .center) {
                        Text("You have indicated that the symptoms are:")
                            .padding(.bottom, 10)
                        Text(recurrent ? "Recurrent." : "NOT recurrent.")
                            .bold()
                    }
                    .frame(width: 200)
                    .padding(10)
                    .background(.thinMaterial)
                    .cornerRadius(10)
                    
                    
                    Spacer()
                }
                .padding(20)
                .frame(width: 350, height: 500)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .shadow(color: .white.opacity(0.5), radius: 5, y: 5)
                
                VStack {
                    Spacer()
                    Text("Do you have any last comments or concerns?")
                        .font(.system(size: 27, design: .serif))
                    Spacer()
                    Spacer()
                    TextField(
                        "Last comments here.",
                        text: $lastComments
                    )
                    .padding([.leading, .trailing])
                    .frame(maxWidth: .infinity)
                    .frame(height: 30)
                    .background(.ultraThinMaterial)
                    .shadow(radius: 2, x: 2, y: 2)
                    .cornerRadius(10)
                    
                    Button {
                        
                    } label: {
                        Text("Submit")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .padding(5)
                            .frame(width: 150)
                            .background(LinearGradient(colors: [Color.indigo.opacity(0.3), Color.blue.opacity(0.3)], startPoint: .leading, endPoint: .trailing))
                            .background(.ultraThinMaterial)
                            .shadow(radius: 5, y: 5)
                            .cornerRadius(10)
                    }
                    .padding([.top], 20)
                    
                    Text(progress != 100.0 ? "Please make sure to complete **all** fields before continuing." : "")
                        .frame(width: 250)
                        .padding(10)
                    
                    
                    Spacer()
                }
                .padding(20)
                .frame(width: 350, height: 500)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .shadow(color: .white.opacity(0.5), radius: 5, y: 5)
            }
            
            
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
//        .ignoresSafeArea()
        
    }
        
        
        
        

        
        
//        ScrollView {
//            VStack(spacing: 20) {
//                
//                ProgressView(value: progress) {
//                    Text("Progress: \(progress)")
//                }
//                .progressViewStyle(CustomProgressViewStyle())
//                
//                
//                Text("Symptom Report")
//                    .font(.system(size: 35, design: .serif))
//                    .padding(20)
//                TabView {
//                    
//                    
//                    ZStack {
//                        VStack {
//                            Text("In a few words, describe how or what you are feeling:")
//                                .font(.system(size: 20, design: .serif))
//                            
//                            HStack {
//                            
//                                TextField("Shortness of breath, heart palpitations,...", text: $symptoms)
//                                
//                                    .font(.system(size: 22, design: .serif))
//                                    .padding(10)
//                                    .frame(maxWidth: .infinity)
//                                    .frame(height: 25)
//                                    .background(.white)
//                                    .cornerRadius(20)
//                                    .padding(20)
//                                
//                            }
//                            
//                            .padding([.leading, .trailing], 15)
//                        }
//                        .frame(maxWidth: .infinity)
//                        .frame(height: 300)
//                        .background(.red)
//                        .cornerRadius(15)
//                        .padding([.leading, .trailing])
//                    }
//                    
//                    
//                    
//                    ZStack {
//                        QuestionView()
//                        VStack {
//                            Slider(
//                                value: $feeling,
//                                in: 0...100,
//                                onEditingChanged: { editing in
//                                    isEditing = editing
//                                }
//                            )
//                            .padding(10)
//                            Text("You have indicated ~\(Int(feeling))")
//                        }
//                        
//                        
//                    }
//                    
//
//                    
//                    
//                }
//                .frame(height: 600)
//                
//                
//                
//            }
//            .tabViewStyle(.page(indexDisplayMode: .always))
//            .indexViewStyle(.page(backgroundDisplayMode: .always))
//            .padding(20)
//            
//        }
    
    
}

struct CustomProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .background(.clear)
            .padding([.top, .leading, .trailing], 30)
            
    }
}

#Preview {
    SymptomView()
}
