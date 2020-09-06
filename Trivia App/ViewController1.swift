//
//  ViewController.swift
//  Trivia App
//
//  Created by Mujahid on 05/09/20.
//  Copyright © 2020 Mujahid. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {
    
    @IBOutlet weak var tfName: CustomTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        tfName.text = nil
        UserDefaults.standard.set(nil, forKey: "userName")
    }
    @IBAction func onClickNext(_ sender: Any) {
        // validation
        guard let name = tfName.text, name.count > 0 else{
            self.showToast(message: "Required Field")
            return
        }
        // for saving user name
        UserDefaults.standard.set(name, forKey: "userName")
        // moving to ViewController2
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onClickShow(_ sender: Any) {
        // moving to History Screen
        let vc = storyboard?.instantiateViewController(withIdentifier: "HistoryVC") as! HistoryVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

