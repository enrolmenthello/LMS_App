//
//  APIConstants.swift
//  LMS_App
//
//  Created by 유상 on 2023/01/27.
//

import Foundation
import Alamofire


private let baseURL = "http://localhost:8080"

struct APIManager {
    
    static let shared = APIManager()
    
    func getData<T: Decodable>(urlEndpointString: String,
                               dataType: T.Type,
                               parametrs: Parameters,
                               completionHandler: @escaping (GeneralResponseModel<T>)->Void) {
        guard let url = URL(string: baseURL + urlEndpointString) else {return}
        let parameter: Codable = parametrs
        
        AF
            .request(url,
                     method: .get,
                     parameters: parameter,
                     headers: nil)
            .responseDecodable(of: GeneralResponseModel<T>.self) { response in
                switch response.result {
                case .success(let success):
                    completionHandler(success)
                case .failure(let error):
                    print(error)
                }
            }
            .resume()
    }
    
    
    func postData<T: Codable>(urlEndpointString: String,
                              dataType: T.Type,
                              parameters: Parameters,
                              completionHandler: @escaping (GeneralResponseModel<T>)->Void) {
        guard let url = URL(string: baseURL + urlEndpointString) else {return}
        let parameter: Codable = parameters
        
        AF
            .request(url,
                     method: .post,
                     parameters: parameter,
                     encoder: .json,
                     headers: nil)
            .responseDecodable(of: GeneralResponseModel<T>.self) { response in
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
