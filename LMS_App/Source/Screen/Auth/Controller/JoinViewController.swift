//
//  JoinViewController.swift
//  LMS_App
//
//  Created by 유상 on 2023/01/17.
//

import UIKit

class JoinViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextFiled: UITextField!
    @IBOutlet weak var pwCheckTextField: UITextField!
    @IBOutlet weak var nameTextFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        joinVCInit()
        
        
    }
    
    func joinVCInit() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.title = "회원 가입"
    }
    
    
    @IBAction func checkId(_ sender: Any) {
        //id Spring과 연결해서 중복확인
    }
    
    @IBAction func join(_ sender: Any) {
        
        if pwCheck() {
            // spring 넘겨주기
        }else {
            // 일단 alert로 처리하기
            let alert = UIAlertController(title: "비밀번호 불일치", message: "비밀번호와 비밀번호 재확인이 일치하지 않습니다.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default)
            
            alert.addAction(ok)
            
            self.present(alert, animated: true)
        }
    }
    
    private func pwCheck() -> Bool {
        let pw = pwTextFiled.text
        let checkPw = pwCheckTextField.text
        
        if pw == checkPw {
            return true
        }else{
            return false
        }
    }
    

}
