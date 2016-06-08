//
//  SearchTableViewController.swift
//  tarin
//
//  Created by kpugame on 2016. 6. 6..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController,UISearchBarDelegate, UISearchResultsUpdating {

    let ParsingData = ParsingInFile()
    var searchController: UISearchController!
    
    var temptableView: UITableView = UITableView()
    var filterdData = [StationInfo]()
    var selectedData: StationInfo?
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)->UITableViewCell
    {

        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        if(cell.isEqual(NSNull))
        {
            cell = NSBundle.mainBundle().loadNibNamed("Cell", owner: self, options: nil)[0] as! UITableViewCell;
        }
        let station1: StationInfo
        if self.searchController.active && self.searchController.searchBar.text != ""{
            station1 = filterdData[indexPath.row]
        }
        else
        {
            station1 = ParsingData.stations[indexPath.row]
        }
        cell.textLabel!.text = station1.name
        cell.detailTextLabel!.text = station1.lineNumber
        cell.imageView!.image = UIImage(named:station1.imageName )
        
        return cell as UITableViewCell
    
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if self.searchController.active && self.searchController.searchBar.text != ""{
            return filterdData.count
        }
        else
        {
            return ParsingData.a_posts.count

        }
     }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ParsingData.beginParsing(parsingMode: 1)
 
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        self.searchController.searchBar.delegate = self
        self.searchController.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        self.searchController.searchBar.sizeToFit()
        self.searchController.searchBar.searchBarStyle = .Minimal
        
        self.tableView.tableHeaderView = self.searchController.searchBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    func filterContentForSearchText(searchBar: UISearchBar, searchText: String)
    {
        filterdData = ParsingData.stations.filter({(station: StationInfo) -> Bool in
            return station.name.lowercaseString.containsString(searchText.lowercaseString)})
        self.tableView.reloadData()
        
    }
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        //do whatever with searchController here.
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar, searchText: searchBar.text!)
    }
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        self.updateSearchResultsForSearchController(self.searchController)
    }
  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "StationListSelect"{
            let destination = segue.destinationViewController as! ResultTabBarController
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let stations: StationInfo
                if searchController.active && searchController.searchBar.text != ""{
                    stations = filterdData[indexPath.row]
                }
                else
                {
                    stations = ParsingData.stations[indexPath.row]
                }
                destination.nameLabelText = stations.name
                destination.LineNumImageText = stations.imageName

                switch stations.lineNumber
                {
                case "신분당선":
                    destination.LineNum = 10
                    break
                case "분당선":
                    destination.LineNum = 11
                    break
                case "수인선":
                    destination.LineNum = 11
                    break
                case "인천지하철 1호선":
                    destination.LineNum = 12
                    break
                case "경춘선":
                    destination.LineNum = 13
                    break
                case "경의중앙선":
                    destination.LineNum = 14
                    break
                case "공항철도":
                    destination.LineNum = 15
                    break
                case "의정부경전철":
                    destination.LineNum = 16
                    break
                case "에버라인":
                    destination.LineNum = 17
                    break
                default:
                     destination.LineNum = Int(stations.lineNumber)
                    break
                }
               
            }
          
        }
        
       
    }
    
}
