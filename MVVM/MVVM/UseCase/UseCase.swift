//
//  UseCase.swift
//  MVVM
//
//  Created by Jun Ho JANG on 2021/10/13.
//

import Foundation
import RxCocoa
import RxSwift

protocol MemberListUseCaseProtocol {
    func fetchMemberList(_ path: String) -> Observable<[Member]>
}

class MemberListUseCase: MemberListUseCaseProtocol {
    
    var networkManager: NetworkManager
    
    init() {
        self.networkManager = NetworkManager()
    }
   
    func fetchMemberList(_ path: String) -> Observable<[Member]> {
        return Observable.create { (observer) -> Disposable in
            self.networkManager.sendRequest(path: path, type: MemberResponse.self) { (error, memberList) in
                if let error = error {
                    observer.onError(error)
                }
                if let memberList = memberList?.member {
                    observer.onNext(memberList)
                }
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }

}
