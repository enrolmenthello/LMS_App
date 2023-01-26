//
//  EnrolmentViewController.swift
//  LMS_App
//
//  Created by 유상 on 2023/01/25.
//

import UIKit

class EnrolmentViewController: UIViewController {

    @IBOutlet weak var subjectTextField: UITextField!
    
    
    @IBOutlet weak var subjectList: UITableView! {
        didSet {
            subjectList.delegate = self
            subjectList.dataSource = self
            
            let subjectCellNib = UINib(nibName: "SubjectCell", bundle: nil)
            
            subjectList.register(subjectCellNib, forCellReuseIdentifier: "SubjectCell")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enrolmentVCInit()
    }
    
    func enrolmentVCInit() {
        self.navigationItem.title = "미리담기 및 수강신청"
    }
    
    @IBAction func subjectSearch(_ sender: Any) {
    }
    
}


extension EnrolmentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let subject = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath) as! SubjectCell
        
        subject.setSubject(subject: "신청 / 담기", professorName: "신청 / 담기", time: "신청 / 담기", grade: "3", quantity: "23 / 25")
        
        subject.showDamgiButton()
        subject.deleteHidden()
        
        return subject
    }
    
    
}
