//
//  APIService.swift
//  Spintip
//
//  Created by Igor Zgonnik on 20.04.2024.
//

import Foundation
import Alamofire

class APIService {
    
    static let sharedInstance = APIService()
    
    typealias MyApiIntermediateSuccess = (UserModel) -> Void
    typealias MyApiIntermediateFailure = (Error) -> Void
    
    
    func fetchUserData(id: String,
                      success: @escaping MyApiIntermediateSuccess,
                      failure: @escaping MyApiIntermediateFailure) {
        
        let url = URLsConstant.baseApiURL
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer access token"
        ]
        
        let parameters = ["id" : id]
        
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers, interceptor: nil)
            .response { resp in
                switch resp.result {
                case .success(let data):
                    do{
                        let jsonData = try JSONDecoder().decode(UserModel.self, from: data!)
                        success(jsonData)
                        print(jsonData)
                    } catch {
                        print(String(describing: error))
                        failure(error)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    print(String(describing: error))
                    failure(error)
                }
            }
    }
}
