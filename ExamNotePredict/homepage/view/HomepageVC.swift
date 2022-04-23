//
//  MainpageVC.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 4.04.2022.
//

import Foundation
import UIKit
let appDelegate = UIApplication.shared.delegate as! AppDelegate

class HomepageVC:UIViewController{

    @IBOutlet weak var continueButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        continueButton.reshapeButton()
    }
    
    @IBAction func continueButtonPressed(){
        performSegue(withIdentifier: "DataSourceVC", sender: nil)
    }
}
