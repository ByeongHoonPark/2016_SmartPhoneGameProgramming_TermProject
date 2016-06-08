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
    
    var StartStationName: String?
    var DestinationName: String?

  var ParsingData = ParsingInWeb_Transfer()
    override func viewDidLoad() {
        super.viewDidLoad()
            StartLabel.text = StartStationName
        DestLabel.text = DestinationName
        ParsingData.beginParsing(StartStationName!, destStation: DestinationName!)
        print("완료")
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
