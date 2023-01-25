//
//  UserSubjectViewController.swift
//  LMS_App
//
//  Created by 유상 on 2023/01/24.
//

import UIKit

class BackpackViewController: UIViewController {
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var subjectList: UITableView! {
        didSet {
            subjectList.dataSource = self
            subjectList.delegate = self
            
            let subjectCellNib = UINib(nibName: "SubjectCell", bundle: nil)
            
            subjectList.register(subjectCellNib, forCellReuseIdentifier: "SubjectCell")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backpackVCInit()
    }
    
    func backpackVCInit() {
        self.tabBarController?.navigationItem.title = "책가방"
    }
    
}


extension BackpackViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let subjectCell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath) as! SubjectCell
    
        subjectCell.setSubject(subject: "미리담기입니다", professorName: "미리담기", time: "미리담기", grade: "3", quantity: "20")
        
        
        return subjectCell
    }
    
    
}
