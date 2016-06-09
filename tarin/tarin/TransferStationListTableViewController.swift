//
//  TransferStationListTableViewController.swift
//  tarin
//
//  Created by kpugame on 2016. 6. 9..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import UIKit

class TransferStationListTableViewController: UITableViewController {
    var StartStationName: String?
    var DestinationName: String?
    var ShortTimeInfoStationList: Array<String>?
    var ShortTrasferInfoStationList: Array<String>?
    var StartStationImageName: String?
    var DestStationImageName: String?
    
    var StartStationName2: String?
    var DestinationName2: String?
    var ShortTimeInfoStationList2: Array<String>?
    var ShortTrasferInfoStationList2: Array<String>?
    var StartStationImageName2: String?
    var DestStationImageName2: String?
    var selectMode = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StartStationName2 = StartStationName
         DestinationName2 = DestinationName
         ShortTimeInfoStationList2 = ShortTimeInfoStationList
         ShortTrasferInfoStationList2 = ShortTrasferInfoStationList
         StartStationImageName2 = StartStationImageName
         DestStationImageName2 = DestStationImageName
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Table View
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        var count = 0
        if selectMode == 1
        {
            count =  ShortTimeInfoStationList2!.count
        }
        if selectMode == 2
        {
            count = ShortTrasferInfoStationList2!.count
        }
        return count
       
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("stationListCell", forIndexPath: indexPath)
        if selectMode == 1
        {
          cell.textLabel!.text =  ShortTimeInfoStationList2![indexPath.row]
        }
        else if selectMode == 2
        {
            cell.textLabel!.text =  ShortTrasferInfoStationList2![indexPath.row]
        }
        

        //candy.name
        return cell
    }
    
   
}
