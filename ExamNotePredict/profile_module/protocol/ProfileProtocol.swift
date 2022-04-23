//
//  ProfileProtocol.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 23.04.2022.
//

import Foundation


protocol ViewToPresenterProfileProtocol{
    var interactor:PresenterToInteractorProfileProtocol? {get set}
    var view:PresenterToViewProfileProtocol? {get set}
    func getProfile()
    func logout()
    func updateProfile(userModel:UserModel,signInModel:SignInData)
}

protocol PresenterToInteractorProfileProtocol{
    var presenter:InteractorToPresenterProfileProtocol? {get set}
    func getProfile()
    func logout()
    func updateProfile(userModel:UserModel,signInModel:SignInData)
}

protocol InteractorToPresenterProfileProtocol{
    func getResult(result:Bool,userModel:UserModel)
    func getResult(result:Bool)
}

protocol PresenterToViewProfileProtocol{
    func getResult(result:Bool,userModel:UserModel)
    func getResult(result:Bool)
}

protocol PresenterToRouterProfileProtocol{
    static func createModule(ref:ProfileVC)
}
