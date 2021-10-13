//
//  Member.swift
//  MVVM
//
//  Created by Jun Ho JANG on 2021/10/13.
//

import Foundation

struct MemberResponse: Decodable {
    
    let member: [Member]
    
}

struct Member: Decodable {
    
    let activityname: String
    let name: String
    let birth: String
    let mbti: String
    let bloodtype: String
    let mainimage: String
    
}
