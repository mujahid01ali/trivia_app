//
//  HistoryVC.swift
//  Trivia App
//
//  Created by Mujahid on 06/09/20.
//  Copyright © 2020 Mujahid. All rights reserved.
//

import UIKit

class HistoryVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var userData:[TriviaData]? = [TriviaData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // for getting the data in aarry and reversed the array
        userData = DatabaseHelper.shareInstance.getUserData().reversed()
       // setup the tableview
        setupTableView()

        // Do any additional setup after loading the view.
    }
    func setupTableView() {
        // register  the cell
        tableView.registerCellNib(TableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    // get count from the userdata array
    func getRowsCount() -> Int{
        if let data = userData{
            return data.count
        }else{
            return 0
        }
    }

}
extension HistoryVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getRowsCount()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        // setting data the UITableViewCell
        cell.setData(res: userData![indexPath.row])
        return cell
    }
}
