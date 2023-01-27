//
//  APIConstants.swift
//  LMS_App
//
//  Created by 유상 on 2023/01/27.
//

import Foundation



struct APIConstants {
    
    static let baseURL = "http://localhost:8080"
    
    // 로그인
    static let loginURL = "/member/members/login"
    
    // 회원 가입
    static let joinURL = "/member/members/new"
    
    // 과목 받아오기
    static let subjectURL = "/subject/subjects"
    
    // 수강 신청
    static let enrolmentURL = "/enrolment/enrolment"
    
    // 신청 취소
    static let cancelURL = "enrolment/enrolments/{enrolmentId}/cancel"
    
    // 미리 담기
    
    // 미리 담기 삭제
    
    
}
