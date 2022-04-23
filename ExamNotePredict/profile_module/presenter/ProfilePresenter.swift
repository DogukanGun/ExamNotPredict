//
//  ProfilePresenter.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 23.04.2022.
//

import Foundation

class ProfilePresenter:ViewToPresenterProfileProtocol{
    
    var interactor: PresenterToInteractorProfileProtocol?
    var view: PresenterToViewProfileProtocol?
    
    func logout() {
        interactor?.logout()
    }
    
    func getProfile() {
        interactor?.getProfile()
    }
    
    func updateProfile(userModel:UserModel,signInModel:SignInData) {
        interactor?.updateProfile(userModel:userModel,signInModel:signInModel)
    }
    
}

extension ProfilePresenter:InteractorToPresenterProfileProtocol{
    func getResult(result: Bool) {
        view?.getResult(result: result)
    }
    
    func getResult(result: Bool,userModel:UserModel) {
        view?.getResult(result: result, userModel:userModel)
    }
}
