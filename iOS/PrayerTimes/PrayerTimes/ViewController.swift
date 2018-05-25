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
    
    // MARK : Property
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Core Location Manager asks for GPS location
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.requestWhenInUseAuthorization()
        locManager.startMonitoringSignificantLocationChanges()
        
        // Load data
        loadSample()
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
    private func loadSample() {
        guard let time1 = Time(name:"Imsak", time:"04:30 (WIB)", gregorian: "22-05-2018", hijri: "06-10-1439", timeStamp: "123456789", latitude: 12.1, longitude: 12.0, timeZone: "GMT+7", method: "2") else {
            fatalError("Unable to instantiate time1")
        }
        guard let time2 = Time(name:"Fajr", time:"04:40 (WIB)", gregorian: "22-05-2018", hijri: "06-10-1439", timeStamp: "123456789", latitude: 12.1, longitude: 12.0, timeZone: "GMT+7", method: "2") else {
            fatalError("Unable to instantiate time2")
        }
        guard let time3 = Time(name:"Sunrise", time:"05:50 (WIB)", gregorian: "22-05-2018", hijri: "06-10-1439", timeStamp: "123456789", latitude: 12.1, longitude: 12.0, timeZone: "GMT+7", method: "2") else {
            fatalError("Unable to instantiate time3")
        }
        guard let time4 = Time(name:"Duhr", time:"11:50 (WIB)", gregorian: "22-05-2018", hijri: "06-10-1439", timeStamp: "123456789", latitude: 12.1, longitude: 12.0, timeZone: "GMT+7", method: "2") else {
            fatalError("Unable to instantiate time4")
        }
        guard let time5 = Time(name:"Asr", time:"15:10 (WIB)", gregorian: "22-05-2018", hijri: "06-10-1439", timeStamp: "123456789", latitude: 12.1, longitude: 12.0, timeZone: "GMT+7", method: "2") else {
            fatalError("Unable to instantiate time5")
        }
        guard let time6 = Time(name:"Sunset", time:"17:44 (WIB)", gregorian: "22-05-2018", hijri: "06-10-1439", timeStamp: "123456789", latitude: 12.1, longitude: 12.0, timeZone: "GMT+7", method: "2") else {
            fatalError("Unable to instantiate time6")
        }
        guard let time7 = Time(name:"Maghrib", time:"17:44 (WIB)", gregorian: "22-05-2018", hijri: "06-10-1439", timeStamp: "123456789", latitude: 12.1, longitude: 12.0, timeZone: "GMT+7", method: "2") else {
            fatalError("Unable to instantiate time7")
        }
        guard let time8 = Time(name:"Isha", time:"18:58 (WIB)", gregorian: "22-05-2018", hijri: "06-10-1439", timeStamp: "123456789", latitude: 12.1, longitude: 12.0, timeZone: "GMT+7", method: "2") else {
            fatalError("Unable to instantiate time8")
        }
        guard let time9 = Time(name:"Midnight", time:"23:50 (WIB)", gregorian: "22-05-2018", hijri: "06-10-1439", timeStamp: "123456789", latitude: 12.1, longitude: 12.0, timeZone: "GMT+7", method: "2") else {
            fatalError("Unable to instantiate time8")
        }
        
        times += [time1,time2,time3,time4,time5,time6,time7,time8,time9]
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
                //printing the json in console
                print(jsonObj!.value(forKey: "data")!)
                
                OperationQueue.main.addOperation({
                    //calling another function after fetching the json
                    //it will show the names to label
                    print("Request done...")
                    indicator.stopAnimating()
                })
            }
        }).resume()
    }
    

}

