//
//  EndPoint.swift
//  MVVM
//
//  Created by Jun Ho JANG on 2021/10/13.
//

import Foundation

enum Scheme: String {
    case https = "https"
}

enum Host: String {
    case base = "544a9ef9-2c3c-441a-824b-97788c0761e8.mock.pstmn.io"
}

enum Path: String {
    case basePath = "/omgtest/main/memberinfo"
}

struct EndPoint {

    func url(with path: String) -> URL? {
        var component = URLComponents()
        component.scheme = Scheme.https.rawValue
        component.host = Host.base.rawValue
        component.path = Path.basePath.rawValue
        return component.url
    }
    
}
