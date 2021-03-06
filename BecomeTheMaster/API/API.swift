//
//  Router.swift
//  BecomeTheMaster
//
//  Created by 이정호 on 2021/03/16.
//

import Foundation
import Alamofire
import RxSwift

struct API {
    
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        return decoder
    }
    
    static func logDecodingError(error: DecodingError){
        switch error {
            
        case let .typeMismatch(type, context):
            DEBUG_LOG("[typeMismatch] type: \(type), context: \(context)")

        case let .valueNotFound(codingKey, context):
            DEBUG_LOG("[valueNotFound] codingKey: \(codingKey), context: \(context)")

        case let .keyNotFound(codingKey, context):
            DEBUG_LOG("[keyNotFound] codingKey: \(codingKey), context: \(context)")

        case let .dataCorrupted(context):
            DEBUG_LOG("[dataCorrupted] context: \(context)")

        @unknown default: return
            
        }
    }
    
}

extension API {
    
    //MARK: 주소 검색
    func addressSearch(word: String, page: Int) -> Observable<KakaoRestAPIModel.AddressSearch> {
        
        return Router.addressSearch(word: word, page: page).buildRequest()
            .flatMap { data -> Observable<KakaoRestAPIModel.AddressSearch> in
                do {
                    let data = try self.decoder.decode(KakaoRestAPIModel.AddressSearch.self, from: data)
                    return Observable.just(data)
                } catch(let error) {
                    return Observable.error(error)
                }
            }
    }
    
    //MARK: 키워드로 주소 검색
    func keywordSearch(page: Int, xPoint: String, yPoint: String, radius: String) -> Observable<KakaoRestAPIModel.KeywordSearch> {
        
        return Router.keywordSearch(page: page, xPoint: xPoint, yPoint: yPoint, radius: radius)
            .buildRequest()
            .flatMap { data -> Observable<KakaoRestAPIModel.KeywordSearch> in
                do {
                    let data = try self.decoder.decode(KakaoRestAPIModel.KeywordSearch.self, from: data)
                    return Observable.just(data)
                } catch(let error) {
                    return Observable.error(error)
                }
            }
    }
    
    //MARK: 좌표를 주소로 변환
    func coord2Address(xPoint: String, yPoint: String) -> Observable<KakaoRestAPIModel.Coord2Address> {
        
        return Router.coord2Address(xPoint: xPoint, yPoint: yPoint)
            .buildRequest()
            .flatMap { data -> Observable<KakaoRestAPIModel.Coord2Address> in
                do {
                    let data = try self.decoder.decode(KakaoRestAPIModel.Coord2Address.self, from: data)
                    return Observable.just(data)
                } catch(let error) {
                    return Observable.error(error)
                }
            }
    }
    
}
