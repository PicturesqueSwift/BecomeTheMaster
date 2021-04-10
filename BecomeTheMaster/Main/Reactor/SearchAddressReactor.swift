//
//  SearchAddressReactor.swift
//  BecomeTheMaster
//
//  Created by 이정호 on 2021/03/30.
//

import UIKit
import RxSwift
import ReactorKit

class SearchAddressReactor: Reactor {
    enum Action {
        case searchAddress(keyWord: String)
        case unknown
    }
    
    enum Mutation {
        case addressList(list: [KakaoRestAPIModel.AddressSearch.Document])
    }
    
    let initialState: State = State()
    
    struct State {
        var addressList: [KakaoRestAPIModel.AddressSearch.Document] = []
    }
}

extension SearchAddressReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        
        case let .searchAddress(keyWord):
            guard let encodedKeyWord = keyWord.addingPercentEncoding(withAllowedCharacters: .urlUserAllowed) else { return Observable.empty() }
            return App.api.addressSearch(word: encodedKeyWord, page: 1)
                .map { $0.documents }
                .flatMap { Observable.just(Mutation.addressList(list: $0)) }
            
        case .unknown: return Observable.empty()
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var returnState = state
        
        switch mutation {

        case let .addressList(list):
            returnState.addressList = list
        }
        
        return returnState
    }
}
