//
//  NetworkResult.swift
//  LMS_App
//
//  Created by 유상 on 2023/01/27.
//

struct GeneralResponseModel: Decodable {
    var code: Int?
    var httpStatus: String?
    var message: String?
}

