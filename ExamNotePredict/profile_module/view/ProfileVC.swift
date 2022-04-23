//
//  ProfileVC.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 23.04.2022.
//

import Foundation
import UIKit

class ProfileVC:UIViewController{
    
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var profileTableView: UITableView!
    var presenter:ViewToPresenterProfileProtocol?
    
    @IBOutlet weak var loginButton: UIBarButtonItem!
    private var profileList = [DataSourceItem]()
    private var userModel = UserModel()
    
    override func viewDidLoad() {
        createTableView()
        updateButton.reshapeButton()
        ProfileRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        setScreen()
    }
    
    private func setScreen(){
        if Session.loggedIn{
            loginButton.title = "Logout"
        }else{
            loginButton.title = "Login"
        }
        self.navigationItem.setHidesBackButton(true, animated: true)
        profileList = [DataSourceItem]()
        profileTableView.reloadData()
        profileTableView.isScrollEnabled = !profileList.isEmpty
        if profileList.isEmpty{
            profileTableView.separatorStyle = .none
        }else{
            profileTableView.separatorStyle = .singleLine
        }
        self.updateButton.isEnabled = Session.loggedIn
        if Session.loggedIn{
            presenter?.getProfile()
            self.updateButton.isHidden = false
            self.view.layoutIfNeeded()
        }else{
            self.updateButton.isHidden = true
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func updateButtonPressed(_ sender: Any) {
        let signInData = SignInData(email: Session.email, password: "")
        signInData.age = profileList[1].value
        signInData.sex = profileList[0].value
        presenter?.updateProfile(userModel: userModel, signInModel: signInData)
    }
    
    private func createTableView(){
        profileTableView.register(UINib(nibName: "DataSourceTableViewCell", bundle: nil), forCellReuseIdentifier: "DataSourceTableViewCell")
        profileTableView.register(UINib(nibName: "SadTableViewCell", bundle: nil), forCellReuseIdentifier: "SadTableViewCell")
        profileTableView.dataSource = self
        profileTableView.delegate = self
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if !Session.loggedIn{
            performSegue(withIdentifier: "SignInVCFromProfile", sender: nil)
        }else{
            presenter?.logout()
        }
    }
    
}

extension ProfileVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if profileList.isEmpty{
            return 1
        }
        return profileList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if profileList.isEmpty{
            guard let cell = profileTableView.dequeueReusableCell(withIdentifier: "SadTableViewCell", for: indexPath) as? SadTableViewCell else{
                return UITableViewCell()
            }
            return cell
        }else{
            guard let cell = profileTableView.dequeueReusableCell(withIdentifier: "DataSourceTableViewCell", for: indexPath) as? DataSourceTableViewCell else{
                return UITableViewCell()
            }
            let datasourceModel = profileList[indexPath.row]
            cell.refresh(datasourceModel: datasourceModel)
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        }
        
    }
}

extension ProfileVC:PresenterToViewProfileProtocol{
    func getResult(result: Bool) {
        if result{
            let alert = UIAlertController(title: "Logout", message: "Succesful", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default,handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
            setScreen()
        }
    }
    
    func getResult(result: Bool, userModel: UserModel) {
        if result{
            profileList = [DataSourceItem]()
            self.userModel = userModel
            var item = DataSourceItem(name: "sex", type: "string",values: ["F","M"],label:nil)
            item.value = userModel.sex ?? ""
            profileList.append(item)
            item = DataSourceItem(name: "age",type: "int", values: ["15","22"],label:nil)
            item.value = userModel.age ?? ""
            profileList.append(item)
            profileTableView.reloadData()
        }
    }
}

extension ProfileVC:DataSourceProtocol{
    func dataSourceValueChanged(cell: DataSourceTableViewCell, value: String) {
        if let row = self.profileList.firstIndex(where: {$0.name == cell.datasourceKey}) {
            profileList[row].value = value
        }
    }
}
