//
//  JoinViewController.swift
//  LMS_App
//
//  Created by 유상 on 2023/01/17.
//

import UIKit
import Alamofire

class JoinViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextFiled: UITextField!
    @IBOutlet weak var pwCheckTextField: UITextField!
    @IBOutlet weak var nameTextFiled: UITextField!
    
    var idCheck = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.title = "회원 가입"
    }
    
    
    @IBAction func checkId(_ sender: Any) {
        let id = idTextField.text ?? ""
       
       
    }
    
    @IBAction func join(_ sender: Any) {
        if pwCheck() && idCheck {
            let id = idTextField.text ?? ""
            let pw = pwTextFiled.text ?? ""
            let name = nameTextFiled.text ?? ""
        }else {
            if idCheck == false {
                showAlert(title: "아이디 중복확인", message: "아이디 중복확인을 진행해주세요.")
            }else{
                showAlert(title: "비밀번호 불일치", message: "비밀번호와 비밀번호 재확인이 일치하지 않습니다.")
            }
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
    
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    

}

