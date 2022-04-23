//
//  DataSourcePresenter.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 4.04.2022.
//

import Foundation

class DataSourcePresenter:ViewToPresenterDataSourceProtocol{
    
    var interactor: PresenterToInteractorDataSourceProtocol?
    
    var view: PresenterToViewDataSourceProtocol?
    
    func predict(datasourceModelList:[DataSourceItem]) {
        interactor?.predict(datasourceModelList: datasourceModelList)
    }
    
    func logout() {
        interactor?.logout()
    }
    
}

extension DataSourcePresenter:InteractorToPresenterDataSourceProtocol{
    func getResult(result: Bool) {
        view?.getResult(result: result)
    }
    
    func getResult(point: Double) {
        view?.getResult(point: point)
    }    
}
