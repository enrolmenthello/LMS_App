//
//  MemberViewModel.swift
//  LMS_App
//
//  Created by 유상 on 2023/03/22.
//

import Foundation
import Alamofire
import Combine

private let LOGIN_URL = "/login"
private let JOIN_URL = "/join"

class AuthViewModel: ObservableObject {
    static let shared = AuthViewModel()
    
    
    @Published var member: Member? = nil
    
    var cancellabels: Set<AnyCancellable> = []
    
    
    func getMember(completionHandler: @escaping (Member?) -> Void){
        $member.sink { member in
            completionHandler(member ?? nil)
        }.store(in: &cancellabels)
    }
    
    func getId(completionHandler: @escaping (String) -> Void){
        $member.sink { member in
            completionHandler(member?.id ?? "")
        }.store(in: &cancellabels)
    }
    
    func getName(completionHandler: @escaping (String) -> Void){
        $member.sink { member in
            completionHandler(member?.name ?? "")
        }.store(in: &cancellabels)
    }
    
    
    func login(id: String, pw: String) {
        let body: Parameters = ["id": id, "password": pw]
        APIManager.shared.postData(urlEndpointString: LOGIN_URL, dataType: Member.self,parameters: body) { [weak self] response in
            if response.code == 200 {
                self?.member = response.result
            }
        }
    }
    
    func join(id: String, pw: String, name: String) {
        let body: Parameters = ["id": id, "password": pw, "name": name]
        APIManager.shared.postData(urlEndpointString: JOIN_URL, dataType: Member.self,parameters: body) { [weak self] response in
            if response.code == 200 {
                self?.member = response.result
            }
        }
    }
    
    
}
