//
//  EnrolmentViewController.swift
//  LMS_App
//
//  Created by 유상 on 2023/01/25.
//

import UIKit

class EnrolmentViewController: UIViewController {

    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var subjecTableView: UITableView!
    
    var subjectList: Array<Subject> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupNavigationBar()
        fetchSubject()
    }
    
    func setup() {
        subjecTableView.delegate = self
        subjecTableView.dataSource = self
        
        let subjectCellNib = UINib(nibName: "SubjectCell", bundle: nil)
        subjecTableView.register(subjectCellNib, forCellReuseIdentifier: "SubjectCell")
    }
    
    func setupNavigationBar() {
        self.navigationItem.title = "미리담기 및 수강신청"
    }
    
    @IBAction func subjectSearch(_ sender: Any) {
    }
    
}


extension EnrolmentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjectList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let subject = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath) as! SubjectCell
        
        if subjectList.count != 0{
            subject.setSubject(subject: subjectList[indexPath.row])
            subject.showDamgiButton()
            subject.deleteHidden()
        }
        return subject
    }
}

extension EnrolmentViewController {
    func fetchSubject() {
        APIManager.shared.getData(urlEndpointString: "/subjectList", dataType: SubjectListResult.self, header: nil) { [weak self] response in
            print(response.result)
            self?.subjectList = response.result
            self?.subjecTableView.reloadData()
        }
    }
}
