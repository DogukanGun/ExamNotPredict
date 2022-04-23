//
//  ProfileRouter.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 23.04.2022.
//

import Foundation

class ProfileRouter:PresenterToRouterProfileProtocol{
    static func createModule(ref: ProfileVC) {
        let presenter = ProfilePresenter()
        ref.presenter = presenter
        ref.presenter?.interactor = ProfileInteractor()
        ref.presenter?.view = ref
        ref.presenter?.interactor?.presenter = presenter
    }
    
    
}
