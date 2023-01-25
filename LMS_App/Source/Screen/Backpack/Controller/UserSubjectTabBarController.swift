//
//  UserSubjectTabBarController.swift
//  LMS_App
//
//  Created by 유상 on 2023/01/25.
//

import UIKit

class UserSubjectTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserTBCInit()
    }
    
    func UserTBCInit() {
        self.tabBar.items?[0].title = "책가방"
        self.tabBar.items?[0].image = UIImage(systemName: "bag")
        
        
        self.tabBar.items?[1].title = "신청 내역"
        self.tabBar.items?[1].image = UIImage(systemName: "person")
    }

}
