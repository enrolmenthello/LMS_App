//
//  NetworkResult.swift
//  LMS_App
//
//  Created by 유상 on 2023/01/27.
//

enum NetworkResult<T> {
    case succes(T) // 통신 성공
    case resultErr(T) // 요청 에러
    case pathErr // 경로 에러
    case serverErr // 서버 내부 에러
    case networkErr // 네트워크 에러
}
