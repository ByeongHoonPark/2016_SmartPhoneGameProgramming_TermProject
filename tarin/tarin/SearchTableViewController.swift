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
    
   // var searchController: UISearchController!
    
    
    var filterdData = [StationInfo]()
    var selectedData: StationInfo?
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)->UITableViewCell
    {
      //  temptableView = tableView
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
        cell.textLabel!.text = station1.name//candy.name
        cell.detailTextLabel!.text = station1.lineNumber//candy.category
        cell.imageView!.image = UIImage(named:station1.imageName )
        
        //cell.textLabel?.text = ParsingData.a_posts.objectAtIndex(indexPath.row).valueForKey("stnName") as! NSString as String
       // cell.detailTextLabel?.text = ParsingData.a_posts.objectAtIndex(indexPath.row).valueForKey("stnLine") as! NSString as String
        
      // let imagename = ParsingData.a_posts.objectAtIndex(indexPath.row).valueForKey("stnImage") as! NSString as String
       // let filePath = NSString(string: \(imagename)")
        //cell.imageView!.image = UIImage(named:ParsingData.a_posts.objectAtIndex(indexPath.row).valueForKey("stnImage") as! NSString as String )
        
        return cell as UITableViewCell
        //cell.textLabel?.text =
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ParsingData.beginParsing(parsingMode: 1)
        //self.search
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        self.searchController.searchBar.delegate = self
       // searchController.searchBar.delegate = self
     //   searchController.searchResultsUpdater = self
     //   searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
      //  temptableView.tableHeaderView = self.searchController.searchBar
     //   definesPresentationContext = true
      //  searchController.searchBar.sizeToFit()
       // temptableView.reloadData()
        // Do any additional setup after loading the view.+
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
            let barViewControllers = segue.destinationViewController as! UITabBarController
            let destination = barViewControllers.viewControllers![0] as! ResultViewController
         //   segue.destinationViewController as! ResultViewController
             //   segue.destinationViewController as! ResultViewController
            if let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell) {
                destination.nameLabelText = ParsingData.stations[indexPath.row].name
                destination.LineNumImageText = ParsingData.stations[indexPath.row].imageName
                print(ParsingData.stations[indexPath.row].lineNumber)
                switch ParsingData.stations[indexPath.row].lineNumber {
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
                     destination.LineNum = Int(ParsingData.stations[indexPath.row].lineNumber)
                    break
                }
               
            }
          
        }
        
       
    }
    
}
