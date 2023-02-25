//
//  ViewModel.swift
//  LMS_App
//
//  Created by 유상 on 2023/02/14.
//

import Foundation
import Combine


class AuthViewModel: ObservableObject {
    @Published var member: Member?
    
    var cancelLables: Set<AnyCancellable> = []
    
    func getMember() -> Member {
        return member ?? Member(id: "", name: "", password: "")
    }
    
    func getId(completion: @escaping (String) -> ()) {
        $member.sink { member in
            completion(member?.id ?? "")
        }.store(in: &cancelLables)
    }
    
    func getName(completion: @escaping (String) -> ()) {
        $member.sink { member in
            completion(member?.name ?? "")
        }.store(in: &cancelLables)
    }
    
    func getPassword(completion: @escaping (String) -> ()) {
        $member.sink { member in
            completion(member?.password ?? "")
        }.store(in: &cancelLables)
    }
    
    
    func createMember(id: String, name: String, password: String) {
        let joinRequest = Member(id: id, name: name, password: password)
        APIManager.shared.postData(urlEndpointString: "/join", dataType: Member.self, header: nil, parameter: joinRequest) { [weak self] response in
            if response.isSuccess == true{
                self?.member = joinRequest
            }
        }
        
    }
    
    func loginMember(id: String, password: String) {
        
    }
    
}
