//
//  SignInData.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 17.04.2022.
//

import Foundation

class SignInData{
    var email:String?
    var password:String?
    var age:String?
    var sex:String?
    
    init(email:String,password:String){
        self.email = email
        self.password = password
    }
}
