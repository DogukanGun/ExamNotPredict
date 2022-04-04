//
//  DataSourceRouter.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 4.04.2022.
//

import Foundation

class DataSourceRouter:PresenterToRouterProtocol{
    static func createModule(ref: DataSourceVC) {
        let presenter = DataSourcePresenter()
        ref.presenter = presenter
        ref.presenter?.interactor = DataSourceInteractor()
        ref.presenter?.view = ref
        ref.presenter?.interactor?.presenter = presenter
    }
    
    
}
