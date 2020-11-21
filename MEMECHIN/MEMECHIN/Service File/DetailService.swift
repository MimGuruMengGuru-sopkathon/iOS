////
////  DetailService.swift
////  MEMECHIN
////
////  Created by 이윤진 on 2020/11/22.
////
//
//import Foundation
//import Alamofire
//
//struct DetailService {
//    //static let detailTestURL = APIConstants.baseURL + "/detail?tag=퇴사짤"
//    private init(){}
//    static let shared = DetailService()
//
//    func showDetailMeme(completion: @escaping(NetworkResult<Any>)->Void){
//
//        let URL = APIConstants.detailTestURL
//        let headers: HTTPHeaders = [
//            "Content-Type": "application/json"
//        ]
//
//        let dataRequest = AF.request(URL,
//                                     method: .get,
//                                     parameters: nil,
//                                     encoding: JSONEncoding.default,
//                                     headers: headers)
//
//        dataRequest.responseData{ (response) in
//
//            switch response.result {
//
//            case .success(_):
//                do{
//                    let decoder = JSONDecoder()
//                    let result = try decoder.decode(ResponseResult<Search>.self,
//                                                    from: value)
//
//                    completion(.success(result.data ?? [SearchMoimResult].self))
//                } catch {
//                    completion(.pathErr)
//                }
//            case .failure(_):
//                //
//            }
//
//
//        }
//    }
//
////    private func judgeMemeData(status: Int, data: Data) -> NetworkResult<Any> {
////        let decoder = JSONDecoder()
////        guard let decodedData = try? decoder.decode(ResponseResult<Search>.self, from: data) else {
////            return .pathErr
////        }
////        switch status {
////        case 200:
////            return .success(decodedData.data)
////
////        case 400..<500:
////            return .requestErr(decodedData.message)
////        case 500:
////            return .serverErr
////        default:
////            return .networkFail
////        }
////    }
//}
