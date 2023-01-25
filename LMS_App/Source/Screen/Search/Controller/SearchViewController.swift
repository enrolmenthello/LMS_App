//
//  SearchViewController.swift
//  LMS_App
//
//  Created by 유상 on 2023/01/20.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var subjectNameTextField: UITextField!
    
    
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
        searchVCInit()
    }
    
    func searchVCInit() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.title = "강좌 검색"
    }
       
    @IBAction func searchSubject(_ sender: Any) {
        // back) 강의 검색
    }
    

}


extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let subjectCell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath) as! SubjectCell
        
        subjectCell.setSubject(subject: "강좌 이름 \("(강좌 번호)")", professorName: "교수 이름", time: "강좌 시간", grade: "3", quantity: "20")
        
        subjectCell.deleteHidden()
        
        return subjectCell
    }
    
    
}

