//
//  LineStaionViewController.swift
//  tarin
//
//  Created by kpugame on 2016. 6. 8..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import UIKit

class LineStaionViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating {

    @IBOutlet weak var stationListTable: UITableView!
    @IBOutlet weak var stationLineImage: UIImageView!
    @IBOutlet weak var stationUI: DetailLineView!
    
    let ParsingData = ParsingInFile()
    var searchController: UISearchController!
    var lineNum: Int = 0
    var stringLineNum: String = ""
    var LineNumImageText : String = ""
    
    var filterdData = [StationInfo]()
    var lineFilterData = [StationInfo]()
    var selectedData: StationInfo?
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)->UITableViewCell
    {
        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("LineSearchCell")!
        if(cell.isEqual(NSNull))
        {
            cell = NSBundle.mainBundle().loadNibNamed("LineSearchCell", owner: self, options: nil)[0] as! UITableViewCell;
        }
        let station1: StationInfo
        if self.searchController.active && self.searchController.searchBar.text != ""{
            station1 = filterdData[indexPath.row]
        }
        else
        {
            station1 = lineFilterData[indexPath.row]
        }
        cell.textLabel!.text = station1.name
        cell.detailTextLabel!.text = station1.lineNumber
        cell.imageView!.image = UIImage(named:station1.imageName )
        
        return cell as UITableViewCell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if self.searchController.active && self.searchController.searchBar.text != ""{
            return filterdData.count
        }
        else
        {
            return lineFilterData.count
            
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        stationListTable.delegate = self
        stationListTable.dataSource = self
        ParsingData.beginParsing(parsingMode: 1)
        
        stationUI.line = lineNum
        stationLineImage.image = UIImage(named: LineNumImageText)
        lineFilterData = ParsingData.stations.filter({(station: StationInfo) -> Bool in
                return  station.lineNumber == stringLineNum
        })
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        self.searchController.searchBar.delegate = self
        self.searchController.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        self.searchController.searchBar.sizeToFit()
        self.searchController.searchBar.searchBarStyle = .Minimal
        
        stationListTable.tableHeaderView = self.searchController.searchBar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func filterContentForSearchText(searchBar: UISearchBar, searchText: String)
    {
        filterdData = lineFilterData.filter({(station: StationInfo) -> Bool in
            return station.name.lowercaseString.containsString(searchText.lowercaseString)})
        stationListTable.reloadData()
        
    }
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar, searchText: searchBar.text!)
    }
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        self.updateSearchResultsForSearchController(self.searchController)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "LineSearchResult"{
            let destination = segue.destinationViewController as! ResultTabBarController
            if let indexPath = stationListTable.indexPathForSelectedRow{
                let stations: StationInfo
                if searchController.active && searchController.searchBar.text != ""{
                    stations = filterdData[indexPath.row]
                }
                else
                {
                    stations = lineFilterData[indexPath.row]
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
