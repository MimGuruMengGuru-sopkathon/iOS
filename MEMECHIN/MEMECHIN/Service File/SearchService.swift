//
//  SearchService.swift
//  MEMECHIN
//
//  Created by 최영재 on 2020/11/22.
//
import Foundation
import Alamofire

struct SearchService {
    private init() {}
    static let shared = SearchService()
    
    func searchloading(completion: @escaping (NetworkResult<Any>)->Void) {
        let URL = APIConstants.search2URL
        let headers: HTTPHeaders = ["Content-Type" : "application/json"]
        
        
        AF.request(URL, method: .get, encoding: JSONEncoding.default, headers: headers).responseData { response in
            switch response.result {
            
            case .success:
                if let value = response.value {
                    if let status = response.response?.statusCode {
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(Search.self, from: value)
                                completion(.success(result))
                            } catch {
                                completion(.pathErr)
                            }
                        default:break
                        }
                    }
                }
            case .failure:completion(.networkFail)
            }
        }
        
    }
}
