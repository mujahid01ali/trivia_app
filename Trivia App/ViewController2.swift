//
//  ViewController2.swift
//  Trivia App
//
//  Created by Mujahid on 05/09/20.
//  Copyright © 2020 Mujahid. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn1: UIButton!
    var arrButtons:[UIButton] = []
    var preTag:Int?
    var array:[String] = [ConstantString.SACHIN_TENDULKAR,ConstantString.VIRAT_KOHLI,ConstantString.ADAM_GILCHIRST,ConstantString.JACQUES_KALLIS]
    var selString:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Button array for selecting one
        arrButtons.append(btn1)
        arrButtons.append(btn2)
        arrButtons.append(btn3)
        arrButtons.append(btn4)
        // set the value for button
        DispatchQueue.main.async {
            for i in 0..<self.arrButtons.count{
                self.arrButtons[i].setIconLableLeft(string: "  " + self.array[i], image: "ic_radio_uncheck")
            }
        }

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        selString = nil
        UserDefaults.standard.set(nil, forKey: "bestCriketer")
        DispatchQueue.main.async {
            for i in 0..<self.arrButtons.count{
                self.arrButtons[i].setIconLableLeft(string: "  " + self.array[i], image: "ic_radio_uncheck")
            }
        }
    }
    @IBAction func btnRadioPressed(_ sender: UIButton) {
        let tag = sender.tag
        // unseleted the previous selected player
        if let newtag = preTag {
            DispatchQueue.main.async {
                self.arrButtons[newtag].setIconLableLeft(string: "  " + self.array[newtag], image: "ic_radio_uncheck")
            }
            
        }
        // Making selection for selected player
         DispatchQueue.main.async {
            self.arrButtons[tag].setIconLableLeft(string: "  " + self.array[tag], image: "ic_radio_check")
         }
        // selected player
        selString = array[tag]
        // pretag is for previos selected item
         preTag = tag
    }
    
    @IBAction func onClickNext(_ sender: Any) {
        // checking for selection
        guard let val = selString else {
            self.showToast(message: "Please select one")
            return
        }
        // saving the choosed player
        UserDefaults.standard.set(val, forKey: "bestCriketer")
        
        // moving to ViewController3
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        navigationController?.pushViewController(vc, animated: true)
    }
    
    

}
