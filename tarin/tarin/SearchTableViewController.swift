//
//  SearchTableViewController.swift
//  tarin
//
//  Created by kpugame on 2016. 6. 6..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {

    let ParsingData = ParsingInFile()
    var temptableView: UITableView = UITableView()
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)->UITableViewCell
    {
      //  temptableView = tableView
        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        if(cell.isEqual(NSNull))
        {
            cell = NSBundle.mainBundle().loadNibNamed("Cell", owner: self, options: nil)[0] as! UITableViewCell;
        }
        
        cell.textLabel?.text = ParsingData.a_posts.objectAtIndex(indexPath.row).valueForKey("stnName") as! NSString as String
        cell.detailTextLabel?.text = ParsingData.a_posts.objectAtIndex(indexPath.row).valueForKey("stnLine") as! NSString as String
        
      // let imagename = ParsingData.a_posts.objectAtIndex(indexPath.row).valueForKey("stnImage") as! NSString as String
       // let filePath = NSString(string: \(imagename)")
        cell.imageView!.image = UIImage(named:ParsingData.a_posts.objectAtIndex(indexPath.row).valueForKey("stnImage") as! NSString as String )
        
        return cell as UITableViewCell
        //cell.textLabel?.text =
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return ParsingData.a_posts.count
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ParsingData.beginParsing(parsingMode: 1)
       // temptableView.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
