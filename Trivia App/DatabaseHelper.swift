//
//  DatabaseHelper.swift
//  CoreDataApp
//
//  Created by Mujahid on 15/08/20.
//  Copyright © 2020 Mujahid. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper{
    static var shareInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    func save(object:[String:String]) {
        let userData = NSEntityDescription.insertNewObject(forEntityName: "TriviaData", into: context!) as! TriviaData
        userData.userName = object["userName"]
        userData.cricketerName = object["cricketerName"]
        userData.flagColors = object["flagColors"]
        userData.dateT = object["dateT"]
        do{
            try context?.save()
        }catch{
            print("data not saved")
        }
    }
    
    func getStudentList() -> [TriviaData] {
        var userData = [TriviaData]()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "TriviaData")
        do{
            userData = try context?.fetch(fetchReq) as! [TriviaData]
            
        }catch{
            print("Error to get Data")
        }
        return userData
    }
    func deleteData(index:Int) -> [TriviaData] {
        var triviaData = getStudentList()
        context?.delete(triviaData[index])
        triviaData.remove(at: index)
        do{
            try context?.save()
        }catch{
            print("Cannot Delete data")
        }
        return triviaData
        
    }
}
