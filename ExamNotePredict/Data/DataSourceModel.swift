//
//  DataSourceModel.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 4.04.2022.
//

import Foundation


class DataSourceModel{
    var key:String
    var type:String
    var value:String
    
    init(key:String,type:String){
        self.key = key
        self.value = ""
        self.type = type
    }
    
}
