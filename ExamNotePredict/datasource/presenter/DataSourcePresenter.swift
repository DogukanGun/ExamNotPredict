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
    
    func predict(datasourceModelList:[DataSourceModel]) {
        interactor?.predict(datasourceModelList: datasourceModelList)
    }
    
}

extension DataSourcePresenter:InteractorToPresenterDataSourceProtocol{
    func getResult(point: Double) {
        view?.getResult(point: point)
    }    
}
