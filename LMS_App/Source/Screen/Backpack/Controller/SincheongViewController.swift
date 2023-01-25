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
            
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
}


extension SincheongViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
