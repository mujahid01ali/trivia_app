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
    var userData = DatabaseHelper.shareInstance.getStudentList().reversed()
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewModel()

        // Do any additional setup after loading the view.
    }
    func setupTableView() {
        tableView.registerCellNib(TableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    func setViewModel() {
        viewList = [ViewTypeModel]()
        for item in userData{
            viewList.append(ViewTypeModel(type: String.className(TableViewCell.self), model: item))
        }
        setupTableView()
    }

}
extension HistoryVC:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = viewList[indexPath.row]
        switch info.type{
        case String.className(TableViewCell.self):
            let res = info.model as! TriviaData
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            cell.setData(res: res,index:indexPath.row)
            return cell
        default:
            return UITableViewCell()
        }
    }
}
