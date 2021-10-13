//
//  MemberDetailViewModel.swift
//  MVVM
//
//  Created by Jun Ho JANG on 2021/10/13.
//

import Foundation

class MemberDetailViewModel {
    
    var memberDetail: MemberDetail?
    
    init() {
        self.memberDetail = nil
    }
    
    func configureDetail(member: Member) {
        self.memberDetail = MemberDetail(activityname: member.activityname, name: member.name, birth: member.birth, mbti: member.mbti, bloodtype: member.bloodtype, mainimage: member.mainimage)
    }
    
    func detailMemberName() -> String {
        guard let detail = memberDetail else {
            return ""
        }
        return detail.activityname
    }
    
    func detailOriginalName() -> String {
        guard let detail = memberDetail else {
            return ""
        }
        return detail.name
    }
    
    func detailBirth() -> String {
        guard let detail = memberDetail else {
            return ""
        }
        return detail.birth
    }
    
    func detailMbti() -> String {
        guard let detail = memberDetail else {
            return ""
        }
        return detail.mbti
    }
    
    func detailBloodtype() -> String {
        guard let detail = memberDetail else {
            return ""
        }
        return detail.bloodtype
    }
    
    func detailMainImage() -> String {
        guard let detail = memberDetail else {
            return ""
        }
        return detail.mainimage
    }
    
}
