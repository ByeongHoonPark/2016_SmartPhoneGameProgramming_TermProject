//
//  TrainLineViewController.swift
//  tarin
//
//  Created by kpugame on 2016. 6. 5..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import UIKit

class TrainLineViewController: UIViewController,UISearchBarDelegate, UISearchResultsUpdating {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var DestinationSwitchButton: UIButton!
    @IBOutlet weak var StartSwitchButton: UIButton!
    @IBOutlet weak var SearchBoundView: UIView!
   
    @IBOutlet weak var SearchBoundView2: UIView!

    @IBOutlet weak var StartStationTableView: UITableView!
    @IBOutlet weak var DestinationStationTableView: UITableView!

    @IBAction func Start(sender: AnyObject) {
        StartStationTableView.hidden = false
        StartSwitchButton.hidden = true
    }
    @IBAction func Destination(sender: AnyObject) {
        DestinationStationTableView.hidden = false
        DestinationSwitchButton.hidden = true
    }
    
    let StartSearchBar = UISearchController(searchResultsController: nil)
    let DestinationSearchBar = UISearchController(searchResultsController: nil)
    
    
    let ParsingData = ParsingInFile()
    var filterdData = [StationInfo]()
    var selectedData: StationInfo?
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)->UITableViewCell
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if self.searchController.active && self.searchController.searchBar.text != ""{
            return filterdData.count
        }
        else
        {
            return ParsingData.a_posts.count
            
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StartSearchBar.searchResultsUpdater = self
        StartSearchBar.dimsBackgroundDuringPresentation = false
        StartSearchBar.searchBar.delegate = self
        StartSearchBar.hidesNavigationBarDuringPresentation = false
        StartSearchBar.searchBar.placeholder = "출발역"
        definesPresentationContext = true
        StartSearchBar.searchBar.sizeToFit()
        StartSearchBar.searchBar.searchBarStyle = .Minimal
        StartStationTableView.tableHeaderView = StartSearchBar.searchBar
        StartStationTableView.hidden = true

        
        DestinationSearchBar.searchResultsUpdater = self
        DestinationSearchBar.dimsBackgroundDuringPresentation = false
        DestinationSearchBar.searchBar.delegate = self
        DestinationSearchBar.hidesNavigationBarDuringPresentation = false
        DestinationSearchBar.searchBar.placeholder = "도착역"
        definesPresentationContext = true
        DestinationSearchBar.searchBar.sizeToFit()
        DestinationSearchBar.searchBar.searchBarStyle = .Minimal
        SearchBoundView2.addSubview(DestinationSearchBar.searchBar)
        DestinationStationTableView.tableHeaderView = DestinationSearchBar.searchBar
        DestinationStationTableView.hidden = true
        var frame2 = DestinationSearchBar.searchBar.frame
        frame2.origin.x = 10
        frame2.origin.y = 0
        frame2.size.width = 340
        DestinationSearchBar.searchBar.frame = frame2
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        if searchBar == StartSearchBar.searchBar
        {
            StartStationTableView.hidden = true
            StartSwitchButton.hidden = false
        }
        if searchBar == DestinationSearchBar.searchBar
        {
            DestinationStationTableView.hidden = true
            DestinationSwitchButton.hidden = false
        }
    }
    func filterContentForSearchText(searchBar: UISearchBar, searchText: String)
    {
      //  filterdData = ParsingData.stations.filter({(station: StationInfo) -> Bool in
      //      return station.name.lowercaseString.containsString(searchText.lowercaseString)})
      //  self.tableView.reloadData()
        
    }
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        //do whatever with searchController here.
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar, searchText: searchBar.text!)
    }
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        if StartSearchBar.active && StartSearchBar.searchBar.text != ""{
           // StartStationTableView.hidden = false
             self.updateSearchResultsForSearchController(StartSearchBar)
        }
        if DestinationSearchBar.active && DestinationSearchBar.searchBar.text != ""{
            self.updateSearchResultsForSearchController(DestinationSearchBar)
        }
       
        
    }


}
