package com.deggan.prayertimes

/**
 * Created by farhan on 5/22/18.
 */
data class Time(val fajr: String,
                val sunrise: String,
                val dhuhr: String,
                val asr: String,
                val sunset: String,
                val maghrib: String,
                val isha: String,
                val imsak: String,
                val midnight: String,
                val gregorian: String,
                val hijri: String,
                val timeStamp: String,
                val latitude: Double,
                val longitude: Double,
                val timeZone: String,
                val method: String)