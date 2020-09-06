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
    var viewList = [ViewTypeModel]()
    var userData:[TriviaData]? = [TriviaData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        userData = DatabaseHelper.shareInstance.getStudentList().reversed()
       // setViewModel()
        setupTableView()

        // Do any additional setup after loading the view.
    }
    func setupTableView() {
        tableView.registerCellNib(TableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    
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
        cell.setData(res: userData![indexPath.row],index:indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            userData = DatabaseHelper.shareInstance.deleteData(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
