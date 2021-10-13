//
//  NetworkService.swift
//  MVVM
//
//  Created by Jun Ho JANG on 2021/10/13.
//

import Foundation
import Alamofire

class NetworkManager {
    
    var endPoint: EndPoint
    
    init() {
        self.endPoint = EndPoint()
    }
    
    func sendRequest<T: Decodable>(path: String, type: T.Type, completion: @escaping ((Error?, T?) -> Void)) {
        let url = endPoint.url(with: path)
        AF.request(url!, method: .get)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: type) { response in
                if let error = response.error {
                    print(error)
                    return completion(error, nil)
                }
                if let list = response.value {
                    return completion(nil, list)
                }
            }
        
    }
    
}
