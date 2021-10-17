//
//  MemberViewModel.swift
//  MVVM
//
//  Created by Jun Ho JANG on 2021/10/13.
//

import Foundation
import RxCocoa
import RxSwift

protocol MemberListViewModelType {
    func fetch(path: String) -> Observable<[Member]>
    func configureMembers(_ members: [Member])
    func membersCount() -> Int?
    func member(indexPath: IndexPath) -> Member?
    func membersSubject() -> BehaviorSubject<[Member]>
}

class MemberListViewModel: MemberListViewModelType {
    
    private let useCase: MemberListUseCaseProtocol
    private var members: BehaviorSubject<[Member]>
    
    init() {
        self.useCase = MemberListUseCase()
        self.members = BehaviorSubject<[Member]>(value: [])
    }
    
    func fetch(path: String) -> Observable<[Member]> {
        return useCase.fetchMemberList(path)
    }
    
    func configureMembers(_ members: [Member]) {
        self.members.onNext(members)
    }
    
    func membersCount() -> Int? {
        do {
            return try self.members.value().count
        } catch {
            return nil
        }
    }
    
    func member(indexPath: IndexPath) -> Member? {
        do {
            return try members.value()[indexPath.row]
        } catch {
            return nil
        }
    }
    
    func membersSubject() -> BehaviorSubject<[Member]> {
        return self.members
    }
    
}
