//
//  MainFilterReactor.swift
//  BecomeTheMaster
//
//  Created by 이정호 on 2021/04/01.
//

import RxSwift
import ReactorKit

class MainFilterReactor: Reactor {
    
    enum Action {
        case findNeighborhood(data: KakaoRestAPIModel.AddressSearch.Document, radius: String)
        case Unknown
    }
    
    enum Mutation {
        case updateNeighborhoodCount(count: Int)
        case Unknown
    }
    
    let initialState: State = State()
    
    struct State {
        var neighborhoodCount: Int = 0
    }
    
}

extension MainFilterReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        
        case let .findNeighborhood(data, radius):
            return App.api.keywordSearch(page: 1, xPoint: data.x, yPoint: data.y, radius: radius)
                .map { return $0.meta.pageableCount }
                .flatMap { Observable.just(Mutation.updateNeighborhoodCount(count: $0)) }
            
        case .Unknown: return Observable.empty()
        
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case let .updateNeighborhoodCount(count):
            newState.neighborhoodCount = count
            
        case .Unknown: break
        }
        
        return newState
    }
}
