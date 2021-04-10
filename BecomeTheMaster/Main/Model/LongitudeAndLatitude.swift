//
//  LongitudeAndLatitude.swift
//  BecomeTheMaster
//
//  Created by 이정호 on 2021/03/30.
//

import UIKit
import Foundation

/*
 경위도: 그 표면 지점의 수직 백터에 따라 그 백터의 방향을 수치화 한 것 (경도와 위도가 만나는 점)
 경도(longitude): 지도에서 세로로 그려진 선, 위도(latitude): 지도에서 가로로 그려진 선
 */

struct LongitudeAndLatitude: Equatable {
    let longitude: Double
    let latitude: Double
    
    init(lon: Double, lat: Double) {
        longitude = lon
        latitude = lat
    }
    
    static func ==(lhs: LongitudeAndLatitude, rhs: LongitudeAndLatitude) -> Bool {
        return lhs.longitude == rhs.longitude && lhs.latitude == rhs.latitude
    }
}

extension LongitudeAndLatitude {
    static func calculateDistance(startPoint lhs: LongitudeAndLatitude, endPoint rhs: LongitudeAndLatitude) -> Double {
        guard lhs != rhs else { return 0 }
        
        let theta = lhs.latitude - rhs.latitude
        
        var distance = ( sin(lhs.longitude.degreeToRadians) * sin(rhs.longitude.degreeToRadians) ) + ( cos(lhs.longitude.degreeToRadians) * cos(rhs.longitude.degreeToRadians) * cos(theta.degreeToRadians) )
        
        distance = acos(distance)
        distance = distance.radiansToDegree
        
        //miles(마일) 기준
        let miles: Double = distance * 60 * 1.1515
        
        //km(킬로미터) 기준
        let kilometer: Double = miles * 1.609344
        
        return kilometer
    }
    
}

/*
 중곡동 좌표
 x: 127.090401426965
 y: 37.5617477458585
 
 자양동 좌표
 x: 127.073018338792
 y: 37.5311077958689
 
 let first = LongitudeAndLatitude(lon: 127.090401426965, lat: 37.5617477458585)
 let second = LongitudeAndLatitude(lon: 127.073018338792, lat: 37.5311077958689)
 let distance = LongitudeAndLatitude.calculateDistance(startPoint: first, endPoint: second)
 DEBUG_LOG("중곡동과 자양동 사이의 거리: \(distance)Km")
 result -> 중곡동과 자양동 사이의 거리: 2.820530074751048Km
 
 출처 : https://www.geodatasource.com/resources/tutorials/how-to-calculate-the-distance-between-2-locations-using-php/
 */
