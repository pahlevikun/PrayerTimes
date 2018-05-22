//
//  Time.swift
//  Prayer Times
//
//  Created by Farhan Yuda Pahlevi on 5/22/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation

class Time{
    var fajr:String?
    var sunrise:String?
    var dhuhr:String?
    var asr:String?
    var sunset:String?
    var maghrib:String?
    var isha:String?
    var imsak:String?
    var midnight:String?
    var gregorian:String?
    var hijri:String?
    var timeStamp:String?
    var latitude:Double?
    var longitude:Double?
    var timeZone:String?
    var method:String?
    
    init?(fajr:String, sunrise:String, dhuhr:String, asr:String, sunset:String, maghrib:String, isha:String, imsak:String, midnight:String, gregorian:String, hijri:String, timeStamp:String, latitude:Double, longitude:Double, timeZone:String, method:String){
        self.fajr = fajr
        self.sunrise = sunrise
        self.dhuhr = dhuhr
        self.asr = asr
        self.sunset = sunset
        self.maghrib = maghrib
        self.isha = isha
        self.imsak = imsak
        self.midnight = midnight
        self.gregorian = gregorian
        self.hijri = hijri
        self.timeStamp = timeStamp
        self.latitude = latitude
        self.longitude = longitude
        self.timeStamp = timeZone
        self.method = method
    }
}
