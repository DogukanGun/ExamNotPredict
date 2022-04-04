//
//  UINavigationItem.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 5.04.2022.
//

import Foundation
import UIKit

extension UINavigationItem{
    func setNavigationBar(){
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.backgroundColor = UIColor(named: "TextColor")
        self.title = "Exam Note Predict"
        self.standardAppearance = standardAppearance
        self.compactAppearance = standardAppearance
        self.scrollEdgeAppearance = standardAppearance
        self.compactScrollEdgeAppearance = standardAppearance
    }
}
