//
//  Storage.swift
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

enum StorageName {
    case license
    case profile
    case post
    case message
    case uid
}

extension Reactive where Base: Storage {
    public func uploadProfileImage(profileImage: UIImage) -> Observable<String> {
        guard let uploadData = profileImage.jpegData(compressionQuality: 1) else { return Observable.empty() } //changed from 0.3
        return Observable.create { obs in
            
            let storageRef = Storage.storage().reference().child("profile_images").child(NSUUID().uuidString)

            storageRef.putData(uploadData, metadata: nil, completion: { (_, err) in
                if let err = err {
                    obs.onError(err)
                }

                storageRef.downloadURL(completion: { (downloadURL, err) in
                    if let err = err {
                        obs.onError(err)
                    } else if let profileImageUrl = downloadURL?.absoluteString {
                        obs.onNext(profileImageUrl)
                        obs.onCompleted()
                    }
                    
                })
            })
            
            return Disposables.create()
        }
        
    }
}
////MARK: - Custom FireBase Storage with Mentor SignUp
//func uploadUserProfileImage(profileImage: UIImage, completion: @escaping (String) -> ()) {
//    guard let uploadData = profileImage.jpegData(compressionQuality: 1) else { return } //changed from 0.3
//
//    let storageRef = Storage.storage().reference().child("profile_images").child(NSUUID().uuidString)
//
//    storageRef.putData(uploadData, metadata: nil, completion: { (_, err) in
//        if let err = err {
//            print("Failed to upload profile image:", err)
//            return
//        }
//
//        storageRef.downloadURL(completion: { (downloadURL, err) in
//            if let err = err {
//                print("Failed to obtain download url for profile image:", err)
//                return
//            }
//            guard let profileImageUrl = downloadURL?.absoluteString else { return }
//            completion(profileImageUrl)
//        })
//    })
//}
