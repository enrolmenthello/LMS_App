//
//  MainViewController.swift
//  LMS_App
//
//  Created by 유상 on 2023/01/17.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var symbolImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainVCInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func mainVCInit() {
        let image = UIImage(named: "symbol.png")
        symbolImage.image = image
        self.navigationItem.backButtonTitle = ""
    }
    
    @IBAction func moveToSearchView(_ sender: Any) {
        guard let searchVC = UIStoryboard(name: "SearchViewController", bundle: nil).instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController else {return}
        
        searchVC.modalTransitionStyle = .coverVertical
        searchVC.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    
    @IBAction func moveToUserView(_ sender: Any) {
        let userSubjectTBC = UIStoryboard(name: "UserSubjectViewController", bundle: nil).instantiateViewController(withIdentifier: "UserSubjectTabBarController")

        self.navigationController?.pushViewController(userSubjectTBC, animated: true)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func moveToEnrolmentView(_ sender: Any) {
        guard let enrolmentVC = UIStoryboard(name: "EnrolmentViewController", bundle: nil).instantiateViewController(withIdentifier: "EnrolmentViewController") as? EnrolmentViewController else {return}
        
        enrolmentVC.modalTransitionStyle = .coverVertical
        enrolmentVC.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(enrolmentVC, animated: true)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func logout(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
