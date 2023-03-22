//
//  NetworkResult.swift
//  LMS_App
//
//  Created by 유상 on 2023/01/27.
//

struct GeneralResponseModel<T : Codable>: Codable {
    var code: Int
    var httpStatus: String
    var message: String
    var result: T?
}

