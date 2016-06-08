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

  var ParsingData = ParsingInWeb_Transfer()
    var filterData = [TransferInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            StartLabel.text = StartStationName
        DestLabel.text = DestinationName
        ParsingData.beginParsing(StartStationName!, destStation: DestinationName!)
        print("완료")
        
       
        //ShortTimeInfoLabel.text
        filterData = ParsingData.TransferData.filter({(info: TransferInfo) ->Bool in
            return info.StartStation == StartStationName
        })
     //   for i in 0 ..< ParsingData.posts.count
      //  {
           ShortTimeInfoLabel.text = ParsingData.posts.objectAtIndex(0).valueForKey("최단경로정보") as! NSString as String
       // }
        //ShortTimeInfoLabel.text = ParsingData.posts.objectAtIndex(<#T##index: Int##Int#>)
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
