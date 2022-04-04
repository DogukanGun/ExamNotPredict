//
//  DataSourceKey.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 4.04.2022.
//

import Foundation

class DataSourceKey{
    
    var datasourceTypeList = [String:String]()
    
    init(){
        fillTypeList()
    }
    
    private func fillTypeList(){
        datasourceTypeList = [ "school" : "string","sex" : "string","age" : "int","address" : "string","famsize" : "string","Pstatus" : "string","Medu" : "int","Fedu" : "int","Mjob" : "string","Fjob" : "string","reason" : "string","guardian" : "string","traveltime" : "int","studytime" : "int","failures" : "int","schoolsup" : "bool","famsup" : "bool","paid" : "bool","activities":"bool","nursery":"bool","higher":"bool","internet":"bool","romantic":"bool","famrel":"int","freetime":"int","goout":"int","Dalc":"int","Walc":"int","health":"int","absences":"int","G1":"int","G2":"int","G3":"int"
]
    }
}
