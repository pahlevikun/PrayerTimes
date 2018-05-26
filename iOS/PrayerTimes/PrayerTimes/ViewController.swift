//
//  ViewController.swift
//  PrayerTimes
//
//  Created by Farhan Yuda Pahlevi on 5/22/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    // MARK : Variable
    var times = [Time]()
    var locManager = CLLocationManager()
    
    var fajr:String?
    var imsak:String?
    var sunrise:String?
    var dhuhr:String?
    var asr:String?
    var sunset:String?
    var maghrib:String?
    var isha:String?
    var midnight:String?
    var name:String?
    var gregorian:String?
    var hijri:String? = ""
    var timeStamp:String?
    var latitude:Double?
    var longitude:Double?
    var timeZone:String?
    var method = "Majlis Ugama Islam Singapura, Singapore"
    
    // MARK : Property
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Core Location Manager asks for GPS location
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.requestWhenInUseAuthorization()
        locManager.startMonitoringSignificantLocationChanges()
        
        // Load data
        getJsonFromUrl()
    }

    // MARK: TableView Method
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MainTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MainTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let timeItem = times[indexPath.row]
        cell.timeLabel.text = timeItem.time
        cell.nameLabel.text = timeItem.name
        
        // Configure the cell...
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return times.count
    }
    
    // MARK: Private method
    
    func addIntoArray(){
        guard let time1 = Time(name:"Imsak", time:self.imsak!, gregorian: self.gregorian!, hijri: self.hijri!, timeStamp: "", latitude: self.latitude!, longitude: self.longitude!, timeZone: self.timeZone!, method: self.method) else {
            fatalError("Unable to instantiate time1")
        }
        
        guard let time2 = Time(name:"Fajr", time:self.fajr!, gregorian: self.gregorian!, hijri: self.hijri!, timeStamp: "", latitude: self.latitude!, longitude: self.longitude!, timeZone: self.timeZone!, method: self.method) else {
            fatalError("Unable to instantiate time1")
        }
        
        guard let time3 = Time(name:"Sunrise", time:self.sunrise!, gregorian: self.gregorian!, hijri: self.hijri!, timeStamp: "", latitude: self.latitude!, longitude: self.longitude!, timeZone: self.timeZone!, method: self.method) else {
            fatalError("Unable to instantiate time1")
        }
        
        guard let time4 = Time(name:"Dhuhr", time:self.dhuhr!, gregorian: self.gregorian!, hijri: self.hijri!, timeStamp: "", latitude: self.latitude!, longitude: self.longitude!, timeZone: self.timeZone!, method: self.method) else {
            fatalError("Unable to instantiate time1")
        }
        
        guard let time5 = Time(name:"Asr", time:self.asr!, gregorian: self.gregorian!, hijri: self.hijri!, timeStamp: "", latitude: self.latitude!, longitude: self.longitude!, timeZone: self.timeZone!, method: self.method) else {
            fatalError("Unable to instantiate time1")
        }
        
        guard let time6 = Time(name:"Sunset", time:self.sunset!, gregorian: self.gregorian!, hijri: self.hijri!, timeStamp: "", latitude: self.latitude!, longitude: self.longitude!, timeZone: self.timeZone!, method: self.method) else {
            fatalError("Unable to instantiate time1")
        }
        
        guard let time7 = Time(name:"Maghrib", time:self.maghrib!, gregorian: self.gregorian!, hijri: self.hijri!, timeStamp: "", latitude: self.latitude!, longitude: self.longitude!, timeZone: self.timeZone!, method: self.method) else {
            fatalError("Unable to instantiate time1")
        }
        
        guard let time8 = Time(name:"Fajr", time:self.isha!, gregorian: self.gregorian!, hijri: self.hijri!, timeStamp: "", latitude: self.latitude!, longitude: self.longitude!, timeZone: self.timeZone!, method: self.method) else {
            fatalError("Unable to instantiate time1")
        }
        
        guard let time9 = Time(name:"Midnight", time:self.midnight!, gregorian: self.gregorian!, hijri: self.hijri!, timeStamp: "", latitude: self.latitude!, longitude: self.longitude!, timeZone: self.timeZone!, method: self.method) else {
            fatalError("Unable to instantiate time1")
        }
        
        self.times += [time1,time2,time3,time4,time5,time6,time7,time8,time9]
    }

    //this function is fetching the json from URL
    func getJsonFromUrl(){
        // ProgressLoading
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        indicator.frame = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
        indicator.center = view.center
        view.addSubview(indicator)
        indicator.bringSubview(toFront: view)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        indicator.startAnimating()
        
        // Getting latitude and longitude from locManager
        guard let latitude = locManager.location?.coordinate.latitude else {
            fatalError("Unable to get latitude")
        }
        guard let longitude = locManager.location?.coordinate.longitude else {
            fatalError("unable to get longitude")
        }
        
        self.latitude = latitude
        self.longitude = longitude
        
        // Getting date from calendar
        let date = Date()
        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: date) // gets current year (i.e. 2017)
        let currentMonth = calendar.component(.month, from: date) // gets current month (i.e. 10)
        let currentDate = calendar.component(.day, from: date) // gets current month (i.e. 10)
        
        // Print it for checking
        print(currentMonth)
        print(currentYear)
        print(latitude)
        print(longitude)
        
        // Making query for URL
        let query = "calendar?latitude=\(latitude)&longitude=\(longitude)&method=11&month=\(currentMonth)&year=\(currentYear)"
        //Create URL
        let url = URL(string: APIConfig.END_POINT+query)
        
        // Fetching the data from the URL
        URLSession.shared.dataTask(with: url!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                print("Doing request...")
                
                if let dataArray = jsonObj!.value(forKey: "data") as? NSArray {
                    
                    var index = 0
                    for data in dataArray{
                        
                        if let dataDict = data as? NSDictionary{
                            if let timingsObj = dataDict.value(forKey: "timings") as? NSDictionary {
                                self.fajr = timingsObj.value(forKey: "Fajr") as? String
                                self.imsak = timingsObj.value(forKey: "Imsak") as? String
                                self.sunrise = timingsObj.value(forKey: "Sunrise") as? String
                                self.dhuhr = timingsObj.value(forKey: "Dhuhr") as? String
                                self.asr = timingsObj.value(forKey: "Asr") as? String
                                self.sunset = timingsObj.value(forKey: "Sunset") as? String
                                self.maghrib = timingsObj.value(forKey: "Maghrib") as? String
                                self.isha = timingsObj.value(forKey: "Isha") as? String
                                self.midnight = timingsObj.value(forKey: "Midnight") as? String
                                
                            }
                            if let dateObj = dataDict.value(forKey: "date") as? NSObject {
                                if let gregorianObj = dateObj.value(forKey: "gregorian") as? NSObject {
                                    self.gregorian = gregorianObj.value(forKey: "date") as? String
                                }
                                if let hijriObj = dateObj.value(forKey: "hijri") as? NSObject {
                                    self.hijri = hijriObj.value(forKey: "date") as? String
                                }
                            }
                            if let metaObj = dataDict.value(forKey: "meta") as? NSObject {
                                self.timeZone = metaObj.value(forKey: "timezone") as? String
                                
                            }
                            if index == (currentDate-1) {
                                self.addIntoArray()
                            }
                            index = index + 1
                        }
                    }
                }
                
                OperationQueue.main.addOperation({
                    //calling another function after fetching the json
                    //it will show the names to label
                    print("Request done...")
                    self.dateLabel.text = self.hijri
                    self.tableView.reloadData()
                    indicator.stopAnimating()
                })
            }
        }).resume()
    }
    

}

