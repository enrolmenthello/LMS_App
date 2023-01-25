//
//  SubjectTableViewCell.swift
//  LMS_App
//
//  Created by 유상 on 2023/01/20.
//

import UIKit

class SubjectCell: UITableViewCell {
    
    @IBOutlet weak var sincheongButtonLeft: NSLayoutConstraint!
    @IBOutlet weak var sincheongButtonRight: NSLayoutConstraint!
    
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var professorName: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var grade: UILabel!
    @IBOutlet weak var quantity: UILabel!
    
    @IBOutlet weak var sincheongButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setSubject(subject: String, professorName: String, time: String, grade: String, quantity: String) {
        self.subject.text = subject
        self.professorName.text = professorName
        self.time.text = time
        self.grade.text = grade
        self.quantity.text = quantity
    }
    
    func sincheongHidden() {
        self.sincheongButton.isHidden = true
    }
    
    func deleteHidden() {
        self.deleteButton.isHidden = true
        
        self.sincheongButtonLeft.constant = 54.0
        self.sincheongButtonRight.constant = -54.0
    }

    @IBAction func requestSubject(_ sender: Any) {
    }
    
    @IBAction func deleteSubject(_ sender: Any) {
    }
    
}
