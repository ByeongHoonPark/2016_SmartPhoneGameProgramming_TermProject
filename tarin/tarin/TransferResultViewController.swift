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
    var StartStationName: String?
    var DestinationName: String?
    var ShortTimeInfoStationList: Array<String>?
    var ShortTrasferInfoStationList: Array<String>?
    
  var ParsingData = ParsingInWeb_Transfer()
    var filterData = [TransferInfo]()
    var test: String?
    override func viewDidLoad() {
        super.viewDidLoad()
            StartLabel.text = StartStationName
        DestLabel.text = DestinationName
        ParsingData.beginParsing(StartStationName!, destStation: DestinationName!)
        print("완료")
        test = ""
       
        //ShortTimeInfoLabel.text
        filterData = ParsingData.TransferData.filter({(info: TransferInfo) ->Bool in
            return info.StartStation == StartStationName
        })
     //   for i in 0 ..< ParsingData.posts.count
      //  {
           ShortTimeInfoLabel.text = ParsingData.posts.objectAtIndex(0).valueForKey("최단경로정보") as! NSString as String
        ShortTrasferInfoLabel.text = ParsingData.posts.objectAtIndex(0).valueForKey("최소환승정보") as! NSString as String
        for i in 0 ..< ParsingData.posts.objectAtIndex(0).valueForKey("최단경로경유역")!.count{
            test?.appendContentsOf(ParsingData.posts.objectAtIndex(0).valueForKey("최단경로경유역")!.objectAtIndex(i) as! String)
        }
        
//        let tempString = string
//        tempString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
//        let strsplit = tempString.characters.split(",")
//        print(strsplit)

        let test2 = test?.removeWhitespace()
        let test3 = test2?.componentsSeparatedByString(",")//test2?.characters.split(",")
        
        for part in test3! {
            print(part)
        }
        
       // }
        //ShortTimeInfoLabel.text = ParsingData.posts.objectAtIndex()
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
extension String {
    func replace(string:String, replacement:String) -> String {
        return self.stringByReplacingOccurrencesOfString(string, withString: replacement, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
    
    func removeWhitespace() -> String {
        return self.replace(" ", replacement: "")
    }
}
