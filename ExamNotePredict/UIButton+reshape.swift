//
//  UIButton+reshape.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 4.04.2022.
//

import Foundation
import UIKit

extension UIButton{
    func reshapeButton(){
        self.layer.cornerRadius = 20
        self.backgroundColor = UIColor(named: "PrimaryColor")
        let attributeString = NSAttributedString(string: self.titleLabel!.text ?? "", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20.0)])
        self.setAttributedTitle(attributeString, for: .normal)
        self.tintColor = UIColor.white
    }
}
