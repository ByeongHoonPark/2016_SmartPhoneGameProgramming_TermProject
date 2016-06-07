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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
//extension SearchTableViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
//    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
 //       filterContentForSearchText(mySearch, searchText: mySearch.text!)
 //   }
//}
//extension SearchTableViewController : UISearchResultsUpdating{
//    func updateSeartchResultForSearchController(searchController: UISearchController){
//        let searchBar = searchController.searchBar
//        filterContentForSearchText(mySearch, searchText: mySearch.text!)
//    }
//}
