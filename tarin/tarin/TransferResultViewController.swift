//
//  TransferResultViewController.swift
//  tarin
//
//  Created by kpugame on 2016. 6. 9..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import UIKit

class TransferResultViewController: UIViewController {
    
    @IBOutlet weak var StartLabel: UILabel!
    @IBOutlet weak var DestLabel: UILabel!
    
    @IBOutlet weak var ShortTimeInfoLabel: UILabel!
    @IBOutlet weak var ShortTrasferInfoLabel: UILabel!
    @IBOutlet weak var StartImage: UIImageView!
    @IBOutlet weak var DestImage: UIImageView!
    var StartStationName: String?
    var DestinationName: String?
    var ShortTimeInfoStationList: Array<String>?
    var ShortTrasferInfoStationList: Array<String>?
    var StartStationImageName: String?
    var DestStationImageName: String?
    var ParsingData = ParsingInWeb_Transfer()
    var filterData = [TransferInfo]()
    var test: String?
    var test_trans: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        StartLabel.text = StartStationName
        DestLabel.text = DestinationName
        ParsingData.beginParsing(StartStationName!, destStation: DestinationName!)
        test = ""
        test_trans = ""
        filterData = ParsingData.TransferData.filter({(info: TransferInfo) ->Bool in
            return info.StartStation == StartStationName
        })

        ShortTimeInfoLabel.text = ParsingData.posts.objectAtIndex(0).valueForKey("최단경로정보") as! NSString as String
        ShortTrasferInfoLabel.text = ParsingData.posts.objectAtIndex(0).valueForKey("최소환승정보") as! NSString as String
        for i in 0 ..< ParsingData.posts.objectAtIndex(0).valueForKey("최단경로경유역")!.count{
            
            print(i)
            test?.appendContentsOf(ParsingData.posts.objectAtIndex(0).valueForKey("최단경로경유역")!.objectAtIndex(i) as! String)
        }
        for i in 0 ..< ParsingData.posts.objectAtIndex(0).valueForKey("최소환승경유역")!.count{
            print(i)
            test_trans?.appendContentsOf(ParsingData.posts.objectAtIndex(0).valueForKey("최소환승경유역")!.objectAtIndex(i) as! String)
        }
        StartImage.image = UIImage(named:StartStationImageName! )
        DestImage.image = UIImage(named:DestStationImageName! )
        
        let test2 = test?.removeWhitespace()
        ShortTimeInfoStationList = test2?.componentsSeparatedByString(",")
        
        let test2_trans = test_trans?.removeWhitespace()
        ShortTrasferInfoStationList = test2_trans?.componentsSeparatedByString(",")

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "timeSeguement"{
            let destination = segue.destinationViewController as! TransferStationListTableViewController
            destination.StartStationName = StartStationName
            destination.DestinationName = DestinationName
            destination.StartStationImageName = StartStationImageName
            destination.DestStationImageName = DestStationImageName
            destination.ShortTimeInfoStationList = ShortTimeInfoStationList
            destination.ShortTrasferInfoStationList = ShortTrasferInfoStationList
            destination.selectMode = 1
        }
        else if segue.identifier == "TransferSegue"
        {
            let destination = segue.destinationViewController as! TransferStationListTableViewController
            destination.StartStationName = StartStationName
            destination.DestinationName = DestinationName
            destination.StartStationImageName = StartStationImageName
            destination.DestStationImageName = DestStationImageName
            destination.ShortTimeInfoStationList = ShortTimeInfoStationList
            destination.ShortTrasferInfoStationList = ShortTrasferInfoStationList
            destination.selectMode = 2
        }
    }
    
    
    
}
extension String {
    func replace(string:String, replacement:String) -> String {
        return self.stringByReplacingOccurrencesOfString(string, withString: replacement, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
    
    func removeWhitespace() -> String {
        return self.replace(" ", replacement: "")
    }
}
