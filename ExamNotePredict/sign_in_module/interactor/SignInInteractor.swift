//
//  SignInInteractor.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 17.04.2022.
//

import Foundation

class SignInInteractor:PresenterToInteractorSignInProtocol{
    let context = appDelegate.persistentContainer.viewContext
    func signUp(signUpModel: SignInData) {
        let userModel = UserModel(context: context)
        userModel.email = signUpModel.email!
        userModel.password = signUpModel.password!
        appDelegate.saveContext()
        Session.email = signUpModel.email!
        presenter?.getResult(signInResult: true)
    }
    
    var presenter: InteractorToPresenterSignInProtocol?

    func signIn(signInModel: SignInData) {
        do{
            let list = try context.fetch(UserModel.fetchRequest())
            var flag = false
            for user in list{
                if user.email == signInModel.email! && user.password == signInModel.password!{
                    Session.email = signInModel.email!
                    presenter?.getResult(signInResult: true)
                    flag = true
                }
            }
            if !flag{
                presenter?.getResult(signInResult: false)
            }
        }catch{
            presenter?.getResult(signInResult: false)
        }
        
    }
    
}
