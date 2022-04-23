//
//  ResultVC.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 5.04.2022.
//

import Foundation
import UIKit

class ResultVC:UIViewController{
    
    @IBOutlet weak var resultLabel: UILabel!
    var resultPoint = -1
    
    
    override func viewWillAppear(_ animated: Bool) {
        resultLabel.text = "Puanınız \(resultPoint)"
    }
}
