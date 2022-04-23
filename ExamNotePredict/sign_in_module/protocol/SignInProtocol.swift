//
//  SignInProtocol.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 17.04.2022.
//

import Foundation

protocol ViewToPresenterSignInProtocol{
    
    var interactor:PresenterToInteractorSignInProtocol? {get set}
    var view:PresenterToViewSignInProtocol? {get set}
    
    func signIn(signInModel:SignInData)
    func signUp(signUpModel:SignInData)

}

protocol PresenterToInteractorSignInProtocol{
    
    var presenter:InteractorToPresenterSignInProtocol? {get set}
    
    func signIn(signInModel:SignInData)
    func signUp(signUpModel:SignInData)
    
}

protocol InteractorToPresenterSignInProtocol{
    
    func getResult(signInResult:Bool)
}

protocol PresenterToViewSignInProtocol{
    
    func getResult(signInResult:Bool)
}

protocol PresenterToRouterSignInProtocol{
    
    static func createModule(ref:SignInVC)
    
}
