//
//  DataSourceTableViewCell.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 5.04.2022.
//

import UIKit

class DataSourceTableViewCell: UITableViewCell {

    
    @IBOutlet weak var datasourceCellTextField: UITextField!
    var datasourceKey:String = ""
    var delegate:DataSourceProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()
        datasourceCellTextField.addTarget(self, action: #selector(valueChange(_:)), for: .editingChanged)

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func valueChange(_ sender: UITextField) {
        if let text = sender.text{
            delegate?.dataSourceValueChanged(cell: self, value: text)
        }
    }
    
    func refresh(datasourceModel:DataSourceModel){
        var placeholderText = datasourceModel.key
        if datasourceModel.type == "int"{
            datasourceCellTextField.textContentType = UITextContentType.creditCardNumber
        }else if datasourceModel.type == "string"{
            datasourceCellTextField.textContentType = UITextContentType.username
        }else if datasourceModel.type == "bool"{
            datasourceCellTextField.textContentType = UITextContentType.username
            placeholderText += " Lütfen sadece yes veya no yazın"
        }
        self.datasourceKey = datasourceModel.key
        datasourceCellTextField.text = ""
        datasourceCellTextField.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "TextColor")]
        )
    }
    
    func getText()->String{
        return datasourceCellTextField.text ?? ""
    }
}
