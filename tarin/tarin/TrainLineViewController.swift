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
    
    @IBOutlet weak var SearchBoundView: UIView!
    @IBOutlet weak var StartstationTableView: UITableView!
    @IBOutlet weak var DestinationStationTableView: UITableView!
    
    @IBOutlet weak var SearchBoundView2: UIView!
    let StartSearchBar = UISearchController(searchResultsController: nil)
    let DestinationSearchBar = UISearchController(searchResultsController: nil)
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
       // StartSearchBar.searchBar.frame = CGRectMake(0, 0, 370, 80)
       // StartSearchBar.searchBar.layer.position = CGPoint(x: 10, y: 64)
        SearchBoundView.addSubview(StartSearchBar.searchBar)
        //self.navigationController?.navigationBar.addSubview(StartSearchBar.searchBar)
        var frame = StartSearchBar.searchBar.frame
        frame.origin.x = 10
        frame.origin.y = 0
        frame.size.width = 370
        StartSearchBar.searchBar.frame = frame
        
        DestinationSearchBar.searchResultsUpdater = self
        DestinationSearchBar.dimsBackgroundDuringPresentation = false
        DestinationSearchBar.searchBar.delegate = self
        DestinationSearchBar.hidesNavigationBarDuringPresentation = false
        DestinationSearchBar.searchBar.placeholder = "도착역"
        definesPresentationContext = true
        DestinationSearchBar.searchBar.sizeToFit()
        DestinationSearchBar.searchBar.searchBarStyle = .Minimal
        SearchBoundView.addSubview(DestinationSearchBar.searchBar)
        var frame2 = DestinationSearchBar.searchBar.frame
        frame2.origin.x = 384
        frame2.origin.y = 0
        frame2.size.width = 370
        DestinationSearchBar.searchBar.frame = frame2

        
        
        //StartstationTableView.tableHeaderView = StartSearchBar.searchBar
      //  StartstationTableView.hidden = false
       // self.tableView.tableHeaderView = self.searchController.searchBar
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            StartstationTableView.hidden = false
             self.updateSearchResultsForSearchController(StartSearchBar)
        }
        if DestinationSearchBar.active && DestinationSearchBar.searchBar.text != ""{
            self.updateSearchResultsForSearchController(DestinationSearchBar)
        }
       
        
    }


}
