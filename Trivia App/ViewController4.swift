//
//  ViewController4.swift
//  Trivia App
//
//  Created by Mujahid on 05/09/20.
//  Copyright © 2020 Mujahid. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {

     @IBOutlet weak var lbNameheading: UILabel!
    @IBOutlet weak var lbDateTitle: UILabel!
    @IBOutlet weak var lbFlagColor: UILabel!
    @IBOutlet weak var lbFlagColorQues: UILabel!
    @IBOutlet weak var lbBestCriketerName: UILabel!
    @IBOutlet weak var lbBestCriketerQues: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDateTime: UILabel!
    // getting all the saved responses
    let userName:String? = UserDefaults.standard.object(forKey: "userName") as? String
    let bestCriketer:String? = UserDefaults.standard.object(forKey: "bestCriketer") as? String
    let flagColors:String? = UserDefaults.standard.object(forKey: "flagColors") as? String
    override func viewDidLoad() {
        super.viewDidLoad()

        // for displaying the response
        display()
    }
    func display() {
       lbDateTime.text = getCurrentTimeDate()
       lbDateTitle.text = "Date :"
        
        if let name = userName{
            lbName.text = name
            lbNameheading.text = "Name :"
        }
        if let criketerName = bestCriketer{
            lbBestCriketerName.text = "Answer : "+criketerName
            lbBestCriketerQues.text = ConstantString.BEST_CRIKETER_QUES
        }
        if let flagColors = flagColors{
            lbFlagColor.text = "Answer : "+flagColors
            lbFlagColorQues.text = ConstantString.FLAG_COLOR_QUESTION
        }
    }
    // for teaking the current date and time
    func getCurrentTimeDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM - HH:mm a"
        return formatter.string(from: date)
    }
    @IBAction func onClickSave(_ sender: Any) {
        // making the dictionary of all the values
        let dic = ["userName":userName,"cricketerName":bestCriketer,"flagColors":flagColors,"dateT":getCurrentTimeDate()]
        // saving the data into the core data base
        DatabaseHelper.shareInstance.save(object: dic as! [String:String])
        // clearing all the saved responses
        UserDefaults.standard.set(nil, forKey: "flagColors")
        UserDefaults.standard.set(nil, forKey: "userName")
        UserDefaults.standard.set(nil, forKey: "bestCriketer")
        // moving to the root
        DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }

}
