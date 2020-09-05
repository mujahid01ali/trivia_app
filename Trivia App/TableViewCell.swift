//
//  TableViewCell.swift
//  Trivia App
//
//  Created by Mujahid on 06/09/20.
//  Copyright © 2020 Mujahid. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lbNameheading: UILabel!
    @IBOutlet weak var lbDateTitle: UILabel!
    @IBOutlet weak var lbFlagColor: UILabel!
    @IBOutlet weak var lbFlagColorQues: UILabel!
    @IBOutlet weak var lbBestCriketerName: UILabel!
    @IBOutlet weak var lbBestCriketerQues: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDateTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(res:TriviaData,index:Int) {
        if let dateT = res.dateT{
            lbDateTime.text = dateT
            lbDateTitle.text = "Date :"
        }
        if let name = res.userName{
            lbName.text = name
            lbNameheading.text = "Name :"
        }
        if let criketerName = res.cricketerName{
            lbBestCriketerName.text = "Answer : "+criketerName
            lbBestCriketerQues.text = ConstantString.BEST_CRIKETER_QUES
        }
        if let flagColors = res.flagColors{
            lbFlagColor.text = "Answer : "+flagColors
            lbFlagColorQues.text = ConstantString.FLAG_COLOR_QUESTION
        }
    }
    
}
