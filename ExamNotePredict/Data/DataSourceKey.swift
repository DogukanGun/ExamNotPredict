//
//  DataSourceKey.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 4.04.2022.
//

import Foundation

class DataSourceKey{
    
    var datasourceTypeList = [DataSourceItem]()
    
    init(){
        fillTypeList()
    }
    
    private func fillTypeList(){
        datasourceTypeList = [DataSourceItem(name: "school",type: "string", values: ["GP","MS"],label:nil),
                              DataSourceItem(name: "sex", type: "string",values: ["F","M"],label:nil),
                              DataSourceItem(name: "age",type: "int", values: ["15","22"],label:nil),
                              DataSourceItem(name: "address", type: "string",values: ["R","M"],label:nil),
                              DataSourceItem(name: "famsize",type: "string", values: ["LE3","GT3"],label:"family size ('LE3' - less or equal to 3 or 'GT3' - greater than 3)"),
                              DataSourceItem(name: "Pstatus", type: "string",values: ["T","A"],label:"parent's cohabitation status ('T' - living together or 'A' - apart)"),
                              DataSourceItem(name: "Medu",type: "string", values: ["0","1","2","3","4"],label:"mother's education (0 - none, 1 - primary education (4th grade), 2 – 5th to 9th grade, 3 – secondary education or 4 – higher education)"),
                              DataSourceItem(name: "Fedu", type: "string",values: ["0","1","2","3","4"],label:"father's education (0 - none, 1 - primary education (4th grade), 2 – 5th to 9th grade, 3 – secondary education or 4 – higher education)"),
                              DataSourceItem(name: "Mjob",type: "string", values: ["teacher","health","services","at_home","other"],label:"mother's job"),
                              DataSourceItem(name: "Fjob", type: "string",values: ["teacher","health","services","at_home","other"],label:"father's job"),
                              DataSourceItem(name: "reason",type: "string", values: ["home","reputation","course","other"],label:"reason to choose this school"),
                              DataSourceItem(name: "guardian", type: "string",values: ["mother","father","other"],label:"student's guardian "),
                              DataSourceItem(name: "traveltime",type: "string", values: ["1","2","3","4"],label:"home to school travel time ( 1 - <15 min., 2 - 15 to 30 min., 3 - 30 min. to 1 hour, or 4 - >1 hour)"),
                              DataSourceItem(name: "studytime", type: "string",values: ["1","2","3","4"],label:" weekly study time (1 - <2 hours, 2 - 2 to 5 hours, 3 - 5 to 10 hours, or 4 - >10 hours)"),
                              DataSourceItem(name: "failures",type: "int", values: ["1","4"],label:"number of past class failures"),
                              DataSourceItem(name: "schoolsup", type: "string",values: ["yes","no"],label:"extra educational support (yes or no)"),
                              DataSourceItem(name: "famsup",type: "string", values: ["yes","no"],label:"family educational support (yes or no)"),
                              DataSourceItem(name: "paid", type: "string",values: ["yes","no"],label:"extra paid classes within the course subject (Math or Portuguese) (yes or no)"),
                              DataSourceItem(name: "activities",type: "string", values: ["yes","no"],label:"extra-curricular activities (yes or no)"),
                              DataSourceItem(name: "nursery", type: "string",values: ["yes","no"],label:"attended nursery school (yes or no)"),
                              DataSourceItem(name: "higher",type: "string", values: ["yes","no"],label:"wants to take higher education (yes or no)"),
                              DataSourceItem(name: "internet", type: "string",values: ["yes","no"],label:"Internet access at home (yes or no)"),
                              DataSourceItem(name: "romantic",type: "string", values: ["yes","no"],label:"with a romantic relationship (yes or no)"),
                              DataSourceItem(name: "famrel", type: "int",values: ["1","5"],label:"quality of family relationships (from 1 - very bad to 5 - excellent)"),
                              DataSourceItem(name: "freetime",type: "int", values: ["1","5"],label:"free time after school (from 1 - very low to 5 - very high)"),
                              DataSourceItem(name: "goout", type: "int",values: ["1","5"],label:"going out with friends (from 1 - very low to 5 - very high)"),
                              DataSourceItem(name: "Dalc",type: "int", values: ["1","5"],label:"workday alcohol consumption (from 1 - very low to 5 - very high)"),
                              DataSourceItem(name: "Walc", type: "int",values: ["1","5"],label:"weekend alcohol consumption (from 1 - very low to 5 - very high)"),
                              DataSourceItem(name: "health",type: "int", values: ["1","5"],label:"current health status (from 1 - very bad to 5 - very good)"),
                              DataSourceItem(name: "absences", type: "int",values: ["0","93"],label:"number of school absences (from 0 to 93)"),
                              DataSourceItem(name: "G1",type: "int", values: ["0","20"],label:"first period grade (from 0 to 20)"),
                              DataSourceItem(name: "G2",type: "int", values: ["0","20"],label:"second period grade (from 0 to 20)"),
                              DataSourceItem(name: "G3",type: "int", values: ["0","20"],label:"final grade (from 0 to 20, output target)")
                              
        ]
    }
}

class DataSourceItem{
    var name:String?
    var type:String?
    var value = ""
    var label:String?
    var values = [String]()
    
    init(name:String,type:String,values:[String],label:String?){
        self.name = name
        self.values = values
        self.type = type
        if let label = label {
            self.label = label
        }
    }
}
  
