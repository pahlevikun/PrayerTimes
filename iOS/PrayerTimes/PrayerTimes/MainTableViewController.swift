//
//  MainTableViewController.swift
//  PrayerTimes
//
//  Created by Farhan Yuda Pahlevi on 5/22/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var times = [Time]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSample()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return times.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MainTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MainTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let timeItem = times[indexPath.row]
        cell.fajrLabel.text = timeItem.fajr

        // Configure the cell...
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func loadSample() {
        
        
        
        guard let time1 = Time(fajr: "05:30", sunrise: "06:30", dhuhr: "12:00", asr: "15:00", sunset: "18:00", maghrib: "18:00", isha: "19:00", imsak: "06:20", midnight: "23:00", gregorian: "22-05-2018", hijri: "06-10-1439", timeStamp: "123456789", latitude: 12.1, longitude: 12.0, timeZone: "GMT+7", method: "2") else {
            fatalError("Unable to instantiate meal1")
        }
       
        times += [time1]
        
    }

}
