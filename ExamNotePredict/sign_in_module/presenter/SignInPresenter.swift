//
//  SignInPresenter.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 17.04.2022.
//

import Foundation

class SignInPresenter:ViewToPresenterSignInProtocol{
    func signUp(signUpModel: SignInData) {
        interactor?.signUp(signUpModel: signUpModel)
    }
    
    var interactor: PresenterToInteractorSignInProtocol?
    
    var view: PresenterToViewSignInProtocol?
    
    func signIn(signInModel:SignInData) {
        interactor?.signIn(signInModel: signInModel)
    }
    
}

extension SignInPresenter:InteractorToPresenterSignInProtocol{
    func getResult(signInResult: Bool) {
        view?.getResult(signInResult: signInResult)
    }
    
    
}
