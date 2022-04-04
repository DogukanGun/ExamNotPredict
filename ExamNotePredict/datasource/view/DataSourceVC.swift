//
//  DataSourceVC.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 4.04.2022.
//

import Foundation
import UIKit

class DataSourceVC:UIViewController{
    
    var presenter:DataSourcePresenter?
    var datasourceList = [DataSourceModel]()
    
    @IBOutlet weak var showResultButton: UIButton!
    @IBOutlet weak var datasourceTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        DataSourceRouter.createModule(ref: self)
        fillDatasourceList()
        createTableView()
        showResultButton.reshapeButton()
    }
    
    private func createTableView(){
        datasourceTableView.register(UINib(nibName: "DataSourceTableViewCell", bundle: nil), forCellReuseIdentifier: "DataSourceTableViewCell")
        datasourceTableView.dataSource = self
        datasourceTableView.delegate = self
    }
    
    private func fillDatasourceList(){
        datasourceList.removeAll()
        for (key,value) in DataSourceKey().datasourceTypeList{
            let dataSourceModel = DataSourceModel(key: key, type: value)
            datasourceList.append(dataSourceModel)
        }
    }
    @IBAction func showResultButtonPressed(_ sender: Any) {
        presenter?.predict(datasourceModelList: datasourceList)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultVC"{
            let destination = segue.destination as! ResultVC
            let point = sender as! Double
            destination.resultPoint = Int(point)
        }
    }
}

extension DataSourceVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasourceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = datasourceTableView.dequeueReusableCell(withIdentifier: "DataSourceTableViewCell", for: indexPath) as? DataSourceTableViewCell else{
            return UITableViewCell()
        }
        let datasourceModel = datasourceList[indexPath.row]
        cell.refresh(datasourceModel: datasourceModel)
        cell.selectionStyle = .none
        cell.delegate = self
        return cell
    }
}

extension DataSourceVC:PresenterToViewDataSourceProtocol{
    func getResult(point: Double) {
        performSegue(withIdentifier: "ResultVC", sender: point)
    }    
}

extension DataSourceVC:DataSourceProtocol{
    func dataSourceValueChanged(cell: DataSourceTableViewCell, value: String) {
        if let row = self.datasourceList.firstIndex(where: {$0.key == cell.datasourceKey}) {
            datasourceList[row].value = value
        } 
    }
}

protocol DataSourceProtocol{
    func dataSourceValueChanged(cell:DataSourceTableViewCell,value:String)
}
 
