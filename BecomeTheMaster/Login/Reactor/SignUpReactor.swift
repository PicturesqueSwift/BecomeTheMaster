//
//  SignUpReactor.swift
//  BecomeTheMaster
//
//  Created by Loho on 2021/01/29.
//  Copyright © 2021 Picturesque. All rights reserved.
//

import Foundation
import UIKit
import ReactorKit

class SignUpReactor: Reactor {
    
    let initialState = State()
    
    enum Action {
        case emailEdited(_ email: String)
        case pwdEdited(_ password: String)
        case pwdCheckEdited(_ passwordCheck: String)
        case nicknameEdited(_ nickname: String)
    }
    
    enum Mutation {
        case isEmailAlert(_ alertMsg: String)
        case isNickNameAlert(_ alertMsg: String)
    }
    
    struct State {
        var emailAlertText: String = ""
        var nicknameAlertText: String = ""
    }
    
    var isEmailAlert: Bool = false
    var isNickNameAlert: Bool = false
    
}

extension SignUpReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .emailEdited(email):
            return Observable.just(Mutation.isEmailAlert(email))
        case let .pwdEdited(password):
            return Observable.empty()
        case let .pwdCheckEdited(passwordCheck):
            return Observable.empty()
        case let .nicknameEdited(nickname):
            return Observable.just(Mutation.isNickNameAlert(nickname))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var returnState = state
        switch mutation {
        
        case let .isEmailAlert(alertMsg):
            returnState.emailAlertText = "이메일 형식이 맞지 않습니다."
            isEmailAlert = !alertMsg.isEmpty
            
        case let .isNickNameAlert(alertMsg):
            returnState.nicknameAlertText = "닉네임이 중복됩니다."
            isNickNameAlert = !alertMsg.isEmpty
        }
        
        return returnState
    }
}
