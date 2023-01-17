//
//  ViewController.swift
//  LMS_App
//
//  Created by 유상 on 2023/01/16.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var symbolImage: UIImageView!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "symbol.png")
        
        symbolImage.image = image
    }


    @IBAction func login(_ sender: Any) {
        if idTextField.text == nil || idTextField.text == "" {
            alertLogin(str: "id")
            return
        }
        if pwTextField.text == nil || pwTextField.text == "" {
            alertLogin(str: "pw")
            return
        }
    }
    
    private func alertLogin(str: String) {
        var title: String
        var messeage: String
        
        if str == "id" {
            title = "아이디 입력"
            messeage = "로그인 하기 위해서는 아이디를 입력해주세요."
        } else{
            title = "비밀번호 입력"
            messeage = "로그인 하기 위해서는 비밀번호를 입력해주세요."
        }
        
        let alert = UIAlertController(title: title, message: messeage, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(ok)
        
        self.present(alert, animated: true)
        
    }
    
    
    @IBAction func moveToJoinVC(_ sender: Any) {
        guard let joinVC = self.storyboard?.instantiateViewController(withIdentifier: "JoinViewController") as? JoinViewController else {return}
        joinVC.modalTransitionStyle = .coverVertical
        joinVC.modalPresentationStyle = .fullScreen
        
        self.present(joinVC, animated: true)
    }

    
}

