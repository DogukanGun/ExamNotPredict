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
    var datasourceList = [DataSourceItem]()
    
    @IBOutlet weak var loginButton: UIBarButtonItem!
    @IBOutlet weak var showResultButton: UIButton!
    @IBOutlet weak var datasourceTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        DataSourceRouter.createModule(ref: self)
        fillDatasourceList()
        createTableView()
        if Session.loggedIn{
            loginButton.title = "Logout"
        }
        self.navigationItem.setHidesBackButton(true, animated: true)
        showResultButton.reshapeButton()
    }
    
    private func createTableView(){
        datasourceTableView.register(UINib(nibName: "DataSourceTableViewCell", bundle: nil), forCellReuseIdentifier: "DataSourceTableViewCell")
        datasourceTableView.dataSource = self
        datasourceTableView.delegate = self
        datasourceTableView.reloadData()
    }
    
    private func fillDatasourceList(){
        datasourceList.removeAll()
        for datasourceItem in DataSourceKey().datasourceTypeList{
            datasourceList.append(datasourceItem)
        }
    }
    @IBAction func showResultButtonPressed(_ sender: Any) {
        presenter?.predict(datasourceModelList: datasourceList)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if !Session.loggedIn{
            performSegue(withIdentifier: "SignInVC", sender: nil)
        }else{
            presenter?.logout()
        }
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
    func getResult(result: Bool) {
        loginButton.title = "Login"
        let alert = UIAlertController(title: "Logout", message: "Succesful", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default,handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    func getResult(point: Double) {
        performSegue(withIdentifier: "ResultVC", sender: point)
    }    
}

extension DataSourceVC:DataSourceProtocol{
    func dataSourceValueChanged(cell: DataSourceTableViewCell, value: String) {
        if let row = self.datasourceList.firstIndex(where: {$0.name == cell.datasourceKey}) {
            datasourceList[row].value = value
        } 
    }
}

protocol DataSourceProtocol{
    func dataSourceValueChanged(cell:DataSourceTableViewCell,value:String)
}
 
