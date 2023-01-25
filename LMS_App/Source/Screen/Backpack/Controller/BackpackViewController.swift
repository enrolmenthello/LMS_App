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
    }
    
}


extension BackpackViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
