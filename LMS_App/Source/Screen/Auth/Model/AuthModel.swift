//
//  JoinModel.swift
//  LMS_App
//
//  Created by 유상 on 2023/02/06.
//

import Foundation

// MARK: - 회원가입 Parameter && 멤버 모델
struct Member: Codable {
    var id: String?
    var name: String?
    var password: String?
}

// MARK: - 로그인 Parameter
struct LoginRequest: Codable {
    var id: String
    var password: String
}

// MARK: - 회원가입 아이디 중복 확인
struct IdCheckRequest: Codable {
    var id: String
}


// MARK: - 회원가입, 로그인 Response
struct AuthResponse: Codable {
    let code: Int
    let httpStatus, message: String
    let result: Member
}


// MARK: - 아이디 중복확인 Response
struct CheckIdResponse: Decodable {
    var code: Int?
    var httpStatus: String?
    var message: String?
    var result: Bool?
}
