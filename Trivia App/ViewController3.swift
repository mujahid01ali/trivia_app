//
//  ViewController3.swift
//  Trivia App
//
//  Created by Mujahid on 05/09/20.
//  Copyright © 2020 Mujahid. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn1: UIButton!
    var arrButtons:[UIButton] = []
    var preTags = [Int]()
    var array:[String] = [ConstantString.WHITE,ConstantString.YELLOW,ConstantString.ORANGE,ConstantString.GREEN]
    var selStrArr = [String]()
    var finalString:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        arrButtons.append(btn1)
        arrButtons.append(btn2)
        arrButtons.append(btn3)
        arrButtons.append(btn4)
        DispatchQueue.main.async {
            for i in 0..<self.arrButtons.count{
                self.arrButtons[i].setIconLableLeft(string: "  " + self.array[i], image: "ic_radio_uncheck")
            }
        }
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        finalString = nil
        selStrArr = []
        preTags = []
        UserDefaults.standard.set(nil, forKey: "flagColors")
        DispatchQueue.main.async {
            for i in 0..<self.arrButtons.count{
                self.arrButtons[i].setIconLableLeft(string: "  " + self.array[i], image: "ic_radio_uncheck")
            }
        }
    }
    @IBAction func onBtnPressed(_ sender: UIButton) {
        let tag = sender.tag
        if preTags.contains(tag) {
            DispatchQueue.main.async {
                self.arrButtons[tag].setIconLableLeft(string: "  " + self.array[tag], image: "ic_radio_uncheck")
            }
            // removing the previous selected item from the array
            preTags.remove(at: preTags.firstIndex(of: tag)!)
            
            
        }else{
            // making the selection for the selected items
            DispatchQueue.main.async {
                self.arrButtons[tag].setIconLableLeft(string: "  " + self.array[tag], image: "ic_radio_check")
            }
            preTags.append(tag)
        }
    }
    
    
    
    @IBAction func onClickNext(_ sender: Any) {
        for index in preTags {
            selStrArr.append(array[index])
        }
        
        // convertin the array a comma seperated string
        finalString = selStrArr.map{String($0)}.joined(separator: ",")
        
        // validation
        guard let val = finalString,val.count > 0 else {
            showToast(message: "Please select at lease one")
            return
        }
        // saving the selected colors of the flag
        UserDefaults.standard.set(val, forKey: "flagColors")
        // moving to ViewController4
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController4") as! ViewController4
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
}
