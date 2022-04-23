//
//  DataSourceInteractor.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 4.04.2022.
//

import Foundation
import Alamofire

class DataSourceInteractor:PresenterToInteractorDataSourceProtocol{
   
    var presenter: InteractorToPresenterDataSourceProtocol?
    
    func logout() {
        Session.loggedIn = false
        presenter?.getResult(result: true)
    }
    
    func predict(datasourceModelList:[DataSourceItem]) {
        var requestList = datasourceModelList.reduce(into: [String: Any]()) {
            $0[$1.name!] = $1.value
        }
        let headers: HTTPHeaders = ["Content-Type":"application/json"]
        AF.request("https://dwapi22.herokuapp.com/predict", method: .post, parameters: requestList,
                   encoding: JSONEncoding.default,headers: headers)
            .responseDecodable(of: DataSourceResponse.self){ response in
                do{
                    print(response.request!.httpBody!)
                    if let response = response.value{
                        self.presenter?.getResult(point: Double(response.result ?? "0.0") ?? 0.0)
                    }else{
                        self.presenter?.getResult(point:  0.0)
                    }
                }catch{
                    print(error)
                }
        }
    }
    
}
/*
 {
  "school":"GP",
  "sex":"M",
  "age":17,
  "address":"R",
  "famsize":"GT3",
  "Pstatus":"T",
  "Medu":2,
  "Fedu":2,
  "Mjob":"other",
  "Fjob":"other",
  "reason":"course",
  "guardian":"father",
  "traveltime":2,
  "studytime":2,
  "failures": 0,
  "schoolsup":"no",
  "famsup":"yes",
  "paid":"yes",
  "activities":"yes",
  "nursery":"yes",
  "higher":"yes",
  "internet":"yes",
  "romantic":"no",
  "famrel":4,
  "freetime":5,
  "goout":2,
  "Dalc":1,
  "Walc":1,
  "health":1,
  "absences":4,
  "G1":11,
  "G2":11,
  "G3":11
 }

 */

