//
//  DataSourceTableViewCell.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 5.04.2022.
//

import UIKit
import iOSDropDown

class DataSourceTableViewCell: UITableViewCell {

    @IBOutlet weak var placeholderText: UILabel!
    @IBOutlet weak var datasourceCellValue: DropDown!
    var datasourceKey:String = ""
    var delegate:DataSourceProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func refresh(datasourceModel:DataSourceItem){
        var list = [String]()
        if datasourceModel.type! == "int"{
            for datasourceItem in (Int(datasourceModel.values[0]) ?? 0)!...(Int(datasourceModel.values[1]) ?? 0){
                list.append(String(datasourceItem))
            }
        }else{
            for datasourceItem in datasourceModel.values{
                list.append(datasourceItem)
            }
        }
        datasourceCellValue.text = datasourceModel.value
        datasourceCellValue.optionArray = list
        datasourceCellValue.placeholder = datasourceModel.name
        if let label = datasourceModel.label{
            placeholderText.text = label
        }else{
            placeholderText.text = datasourceModel.name
        }
        datasourceKey = datasourceModel.name!
        datasourceCellValue.didSelect { selectedText, index, id in
            self.delegate?.dataSourceValueChanged(cell: self, value: selectedText)
        }
    }
    
    func getText()->String{
        return datasourceKey
    }
}
