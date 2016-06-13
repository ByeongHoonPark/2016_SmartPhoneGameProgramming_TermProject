//
//  DetailResultViewController.swift
//  tarin
//
//  Created by kpugame on 2016. 6. 8..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import UIKit

class DetailResultViewController: UIViewController {

    
      @IBOutlet weak var detailNameLabel: UILabel!
      @IBOutlet weak var detailLineImage: UIImageView!
      @IBOutlet weak var detailUIDesignView: DetailLineView!
    var Excode: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        detailNameLabel.text = (self.tabBarController as? ResultTabBarController)?.nameLabelText
        detailLineImage.image = UIImage(named: ((self.tabBarController as? ResultTabBarController)?.LineNumImageText)!)
        detailUIDesignView.line = ((self.tabBarController as? ResultTabBarController)?.LineNum)!
        Excode = ((self.tabBarController as? ResultTabBarController)?.Excode)!
        
       }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "seeMap"{
            let destination = segue.destinationViewController as! MapViewController
            destination.stationName = detailNameLabel.text
            destination.stationExcode = Excode
            //destination.StartStationName = StartStationName
            //destination.selectMode = 1
        }
    }

}
