//
//  Time.swift
//  Prayer Times
//
//  Created by Farhan Yuda Pahlevi on 5/22/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation

class Time{
    var name:String?
    var time:String?
    var gregorian:String?
    var hijri:String?
    var timeStamp:String?
    var latitude:Double?
    var longitude:Double?
    var timeZone:String?
    var method:String?
    
    init?(name:String, time:String, gregorian:String, hijri:String, timeStamp:String, latitude:Double, longitude:Double, timeZone:String, method:String){
        self.name = name
        self.time = time
        self.gregorian = gregorian
        self.hijri = hijri
        self.timeStamp = timeStamp
        self.latitude = latitude
        self.longitude = longitude
        self.timeStamp = timeZone
        self.method = method
    }
}
