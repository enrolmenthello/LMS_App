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
        postCheckId(id: id) { [weak self] response in
            self?.idCheck = response.result ?? false
            if self?.idCheck == true {
                self?.showAlert(title: "아이디 중복확인", message: "가입 할 수 있는 ID 입니다.")
            }else {
                self?.showAlert(title: "아이디 중복확인", message: "중복 된 ID 입니다. 다시 시도해주세요.")
            }
        }
       
    }
    
    @IBAction func join(_ sender: Any) {
        if pwCheck() && idCheck {
            let id = idTextField.text ?? ""
            let pw = pwTextFiled.text ?? ""
            let name = nameTextFiled.text ?? ""
            postJoin(id: id, pw: pw, name: name) { [weak self] response in
                if response.result.id == id {
                    self?.navigationController?.popViewController(animated: true)
                }
            }
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

extension JoinViewController {
    func postCheckId(id: String, completionHandler: @escaping (CheckIdResponse) -> Void) {
        let url = "http://localhost:8080/join/check"
        let params = IdCheckRequest(id: id)
        AF
            .request(url,
                     method: .post,
                     parameters: params,
                     encoder: .json,
                     headers: nil)
            .responseDecodable(of: CheckIdResponse.self) { response in
                switch response.result {
                case .success(let success):
                    completionHandler(success)
                case .failure(let error):
                    print(error)
                }
            }
            .resume()
    }
    
    func postJoin(id: String, pw: String, name: String, completionHandler: @escaping (AuthResponse) -> Void) {
        let url = "http://localhost:8080/join"
        let params = Member(id: id, name: name, password: pw)
        AF
            .request(url,
                     method: .post,
                     parameters: params,
                     encoder: .json,
                     headers: nil)
            .responseDecodable(of: AuthResponse.self) { response in
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
