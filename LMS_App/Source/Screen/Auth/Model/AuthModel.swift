//
//  JoinModel.swift
//  LMS_App
//
//  Created by 유상 on 2023/02/06.
//

import Foundation

// MARK: - 회원가입 Parameter && 멤버 모델
struct Member: Codable {
    var id: String
    var name: String
    var password: String
}

// MARK: - 로그인 Parameter
struct LoginRequest: Codable {
    var id: String
    var password: String
}
