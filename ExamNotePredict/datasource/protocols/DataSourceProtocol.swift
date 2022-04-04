//
//  DataSourceProtocol.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 4.04.2022.
//

import Foundation


protocol ViewToPresenterDataSourceProtocol{
    var interactor:PresenterToInteractorDataSourceProtocol? {get set}
    var view:PresenterToViewDataSourceProtocol? {get set}
    func predict(datasourceModelList:[DataSourceModel])
}

protocol PresenterToInteractorDataSourceProtocol{
    var presenter:InteractorToPresenterDataSourceProtocol? {get set}
    func predict(datasourceModelList:[DataSourceModel])
}

protocol InteractorToPresenterDataSourceProtocol{
    func getResult(point:Double)
}

protocol PresenterToViewDataSourceProtocol{
    func getResult(point:Double)
}

protocol PresenterToRouterProtocol{
    static func createModule(ref:DataSourceVC)
}
