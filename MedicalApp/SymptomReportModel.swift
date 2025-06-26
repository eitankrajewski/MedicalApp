//
//  SymptomReportModel.swift
//  MedicalApp
//
//  Created by Eitan Krajewski on 6/25/25.
//

import Foundation

class SymptomReport: ObservableObject {
    
    var symptoms: String = ""
    var painLevel: String = ""
    var isRecurrent: String = ""
    var extraComments: String = ""
    
    init() {
        symptoms = ""
        painLevel = ""
        isRecurrent = ""
        extraComments = ""
    }
    
    func newReport(symptoms: String, painLevel: String, isRecurrent: String, extraComments: String) {
        self.symptoms = symptoms
        self.painLevel = painLevel
        self.isRecurrent = isRecurrent
        self.extraComments = extraComments
        
//        print("\(symptoms) \(painLevel) \(isRecurrent) \(extraComments)")
    }
//    
//    func addSymptom:
    
}
