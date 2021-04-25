//
//  FirebaseManager.swift
//  BecomeTheMaster
//
//  Created by 이정호 on 2021/02/17.
//

import UIKit
import Firebase

final class FirebaseManager: NSObject {
    static let shared = FirebaseManager()
    
    let auth = Auth.auth()
    let cloudDB = Firestore.firestore()
    let storageRef = Storage.storage().reference()
    let realTimeDBRef = Database.database().reference()
    
    override init() { }
    
}
