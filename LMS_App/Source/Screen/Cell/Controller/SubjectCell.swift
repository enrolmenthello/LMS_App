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
    
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var professorNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var sincheongButton: UIButton!
    @IBOutlet weak var damgiButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var subject: Subject?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func setSubject(subject: Subject) {
        self.subject = subject
        
        let subjectName = "[" + (self.subject?.id?.description ?? "") + "] " + (self.subject?.name ?? "")
        subjectLabel.text = subjectName
        professorNameLabel.text = self.subject?.professor
        timeLabel.text = self.subject?.time
        gradeLabel.text = self.subject?.gradePoint?.description
        quantityLabel.text = self.subject?.stockQuantity?.description
    }
    
    func showDamgiButton() {
        self.damgiButton.isHidden = false
    }
    
    func sincheongHidden() {
        self.sincheongButton.isHidden = true
    }
    
    func deleteHidden() {
        self.deleteButton.isHidden = true
        self.sincheongButtonRight.constant = -59.0
    }
    
    @IBAction func damgiSubject(_ sender: Any) {
    }
    
    @IBAction func requestSubject(_ sender: Any) {
    }
    
    @IBAction func deleteSubject(_ sender: Any) {
    }
    
}

extension SubjectCell {
    func postEnrolment() {
        APIManager.shared
    }
    
    func postCancelEnrolment() {
        
    }
    
    func postPreload() {
        
    }
    
    func postCancelPreload() {
        
    }
}
