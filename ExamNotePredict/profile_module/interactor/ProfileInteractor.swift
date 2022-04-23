//
//  ProfileInteractor.swift
//  ExamNotePredict
//
//  Created by Dogukan Gundogan on 23.04.2022.
//

import Foundation
import CoreData

class ProfileInteractor:PresenterToInteractorProfileProtocol{
    let context = appDelegate.persistentContainer.viewContext
    var presenter: InteractorToPresenterProfileProtocol?
    
    func getProfile() {
        var liste = [UserModel]()
        let fetchRequest:NSFetchRequest<UserModel> = UserModel.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email CONTAINS %@", Session.email)
            do{
                let list = try context.fetch(fetchRequest)
                presenter?.getResult(result: true, userModel: list[0])
            }catch{
                print(error)
            }
    }
    
    func logout() {
        Session.loggedIn = false
        presenter?.getResult(result: true)
    }
    
    func updateProfile(userModel:UserModel,signInModel:SignInData) {
        userModel.age = signInModel.age ?? ""
        userModel.sex = signInModel.sex ?? ""
        
        appDelegate.saveContext()
        
        presenter?.getResult(result: true, userModel: userModel)
    }
}

