//
//  SincheongViewController.swift
//  LMS_App
//
//  Created by 유상 on 2023/01/25.
//

import UIKit

class SincheongViewController: UIViewController {
    @IBOutlet weak var gradeLabel: UILabel!
    
    @IBOutlet weak var sincheongSubjectList: UITableView! {
        didSet {
            sincheongSubjectList.dataSource = self
            sincheongSubjectList.delegate = self
            
            let subjectCellNib = UINib(nibName: "SubjectCell", bundle: nil)
            
            sincheongSubjectList.register(subjectCellNib, forCellReuseIdentifier: "SubjectCell")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sincheongVCInit()
    }
    
    func sincheongVCInit() {
        self.tabBarController?.navigationItem.title = "신청 내역"
    }
}


extension SincheongViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let subjectCell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath) as! SubjectCell
    
//        subjectCell.setSubject(subject: "신청입니다", professorName: "신청입니다", time: "신청입니다", grade: "3", quantity: "20")
        subjectCell.sincheongHidden()
        
        return subjectCell
    }
    
    
}
