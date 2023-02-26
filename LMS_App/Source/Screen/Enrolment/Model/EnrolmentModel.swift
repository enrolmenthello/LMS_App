//
//  EnrolmentModel.swift
//  LMS_App
//
//  Created by 유상 on 2023/02/27.
//

import Foundation


struct SubjectListResult: Codable {
    let code: Int
    let httpStatus, message: String
    let result: [Subject]
}

struct SubjectResult: Codable {
    let code: Int
    let httpStatus, message: String
    let result: Subject
}

struct Subject: Codable {
    let id: Int?
    let name, professor, time: String?
    let gradePoint, stockQuantity: Int?
}
