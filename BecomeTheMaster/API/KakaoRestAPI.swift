//
//  KakaoRestAPI.swift
//  BecomeTheMaster
//
//  Created by Loho on 2020/07/26.
//  Copyright © 2020 Loho. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

enum KakaoRestAPI {
    case addressSearch(word: String, page: Int)
    case keywordSearch(page: Int, xPoint: String, yPoint: String, radius: String)
    case coord2Address(xPoint: String, yPoint: String)
}

extension KakaoRestAPI {
    
    static let baseURLString = "https://dapi.kakao.com/v2/local"
    
    static let headers: HTTPHeaders = ["Authorization" : "KakaoAK d04b22c25b4b214114f4afeebf2c12a5"]
    
    static let httpMethod: Alamofire.HTTPMethod = .get
    
    static let paramEncoding: ParameterEncoding = JSONEncoding.default
    
    static let manager: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
        configuration.timeoutIntervalForResource = 20
        configuration.httpCookieStorage = HTTPCookieStorage.shared
        configuration.urlCache = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
        let manager = Alamofire.Session(configuration: configuration)
        return manager
    }()
    
    var path: String {
        switch self {
        //longitude
        case let .addressSearch(word, page):
            return "/search/address.json?analyze_type=similar&query=\(word)&page=\(page)"
        case let .keywordSearch(page, xPoint, yPoint, radius):
            let word: String = "%EB%8F%99%EC%82%AC%EB%AC%B4%EC%86%8C" // Encoded Word: "동사무소"
            return "/search/keyword.json?page=\(page)&size=15&sort=distance&query=\(word)&x=\(xPoint)&y=\(yPoint)&radius=\(radius)"
        case let .coord2Address(xPoint, yPoint):
            return "/geo/coord2address.json?input_coord=WGS84&x=\(xPoint)&y=\(yPoint)"
        }
    }
    
    var url: URL {
        let urlString = KakaoRestAPI.baseURLString + self.path
        return try! urlString.asURL()
    }
    
}

extension KakaoRestAPI {
    
    func buildRequest(parameters: Parameters = [:]) -> Observable<Data> {
        
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        
        DEBUG_LOG("buildRequest URL: \(self.url.absoluteString)")
                
        return Observable<Data>.create{ (anyObserver) -> Disposable in
            
            let request = AF.request(self.url,
                                     method: KakaoRestAPI.httpMethod,
                                     parameters: parameters,
                                     encoding: KakaoRestAPI.paramEncoding,
                                     headers: KakaoRestAPI.headers)
                
                .responseData(completionHandler: { (dataResponse) in
//                    DEBUG_LOG(dataResponse.debugDescription)
//                    DEBUG_LOG("statusCode: \(dataResponse.response?.statusCode ?? 100)")
                    
                    if let data = dataResponse.data {
                        anyObserver.onNext(data)
                        anyObserver.onCompleted()
                        DispatchQueue.main.async {
                            UIApplication.shared.isNetworkActivityIndicatorVisible = false
                        }
                    }else{
                        if let error = dataResponse.error {
                            let alert: UIAlertController = UIAlertController(title: "청출어람", message: error.localizedDescription, preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
//                            App.delegate.window?.rootViewController?.present(alert, animated: true, completion: nil)
                            anyObserver.onError(error)
                        }
                        DispatchQueue.main.async {
                            UIApplication.shared.isNetworkActivityIndicatorVisible = false
                        }
                    }
                })
            
            return Disposables.create {
                request.cancel()
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        }
    }
}

/*
 중곡동 좌표
 x: 127.090401426965
 y: 37.5617477458585
 */
