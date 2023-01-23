//
//  SubjectTableViewCell.swift
//  LMS_App
//
//  Created by 유상 on 2023/01/20.
//

import UIKit

class SubjectTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var subjectNum: UILabel!
    @IBOutlet weak var subjectName: UILabel!
    @IBOutlet weak var professorName: UILabel!
    @IBOutlet weak var subjectTime: UILabel!
    
    @IBOutlet weak var sincheongButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func setSubject(_ sender: Any) {
    }
    
    @IBAction func deleteSubject(_ sender: Any) {
    }
    
    
}
