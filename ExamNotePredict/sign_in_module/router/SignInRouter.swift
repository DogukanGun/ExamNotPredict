//
//  SignInRouter.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 17.04.2022.
//

import Foundation

class SignInRouter:PresenterToRouterSignInProtocol{
    static func createModule(ref: SignInVC) {
        let presenter = SignInPresenter()
        ref.presenter = presenter
        ref.presenter?.view = ref
        ref.presenter?.interactor = SignInInteractor()
        ref.presenter?.interactor?.presenter = presenter
    }
}
