//
//  Auth.swift
//  BecomeTheMaster
//
//  Created by Picturesque on 2021/01/31.
//

import Foundation
import RxSwift
import RxCocoa
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

extension Reactive where Base: Auth {
    public func createUser(withEmail email: String, password: String) -> Observable<AuthDataResult> {
        return Observable.create { observer in
            self.base.createUser(withEmail: email, password: password) { auth, error in
                if let error = error {
                    DEBUG_LOG("Auth Create User failed: \(error.localizedDescription)")
                    observer.onError(error)
                } else if let auth = auth {
                    DEBUG_LOG("Auth Create User Success")
                    observer.onNext(auth)
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
    
}
