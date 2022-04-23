//
//  SadTableViewCell.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 23.04.2022.
//

import UIKit
import Lottie

class SadTableViewCell: UITableViewCell {

    @IBOutlet weak var animationView: AnimationView!
    override func awakeFromNib() {
        super.awakeFromNib()
        animationView = .init(name: "sad-emoji")
          
        animationView!.frame = self.bounds
    
        animationView!.contentMode = .scaleAspectFit
          
        animationView!.loopMode = .loop
          
        animationView!.animationSpeed = 0.5
          
        self.addSubview(animationView!)
        
        animationView!.play()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
