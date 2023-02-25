//
//  ViewController.swift
//  LMS_App
//
//  Created by 유상 on 2023/01/16.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var symbolImage: UIImageView!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.topItem?.title = ""
    }


    @IBAction @objc
    func login(_ sender: Any) {
        if idTextField.text == nil || idTextField.text == "" {
            showAlert(title: "아이디 입력", message: "로그인 하기 위해서는 아이디를 입력해주세요.")
            return
        }
        if pwTextField.text == nil || pwTextField.text == "" {
            showAlert(title: "비밀번호 입력", message: "로그인 하기 위해서는 비밀번호를 입력해주세요.")
            return
        }
        let id = idTextField.text ?? ""
        let password = pwTextField.text ?? ""
        
        postLogin(id: id, pw: password) { [weak self] response in
            if response.result.id == id {
                MemberToken.member = response.result
                self?.moveToMainVC()
            }
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    
    func moveToMainVC() {
        guard let mainVC = UIStoryboard(name: "MainViewController", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else {return}
        
        mainVC.modalTransitionStyle = .coverVertical
        mainVC.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(mainVC, animated: true)
    }
    
    
    @IBAction func moveToJoinVC(_ sender: Any) {
        guard let joinVC = self.storyboard?.instantiateViewController(withIdentifier: "JoinViewController") as? JoinViewController else {return}
        joinVC.modalTransitionStyle = .coverVertical
        joinVC.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(joinVC, animated: true)
    }

    
}

extension LoginViewController {
    func postLogin(id: String, pw: String, completionHandler: @escaping (AuthResponse) -> Void) {
        let url = "http://localhost:8080/login"
        let params = LoginRequest(id: id, password: pw)
        AF
            .request(url,
                     method: .post,
                     parameters: params,
                     encoder: .json,
                     headers: nil)
            .responseDecodable(of: AuthResponse.self) { response in
                print(response)
                switch response.result {
                case .success(let success):
                    completionHandler(success)
                case .failure(let error):
                    print(error)
                }
            }
            .resume()
    }
}
