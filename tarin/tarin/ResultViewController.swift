//
//  ResultViewController.swift
//  tarin
//
//  Created by kpugame on 2016. 6. 7..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var stationLineNumImage: UIImageView!
    @IBOutlet weak var UIDesignView: DetailLineView!
    @IBOutlet weak var CurrentStationNameLabel: UILabel!

    @IBOutlet weak var trainImage: UIImageView!
    @IBOutlet var xPosition: NSLayoutConstraint!
    
    @IBOutlet weak var destLabel: UILabel!
    @IBOutlet weak var posLabel: UILabel!
    @IBOutlet weak var destLabel2: UILabel!
    @IBOutlet weak var posLabel2: UILabel!
    var nameLabelText : String = ""
    var LineNumImageText : String = ""
    var LineNum: Int?
    var ParsingData = ParsingInWeb_RealTimeArrival()
    var Excode: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabelText = ((self.tabBarController as? ResultTabBarController)?.nameLabelText)!
        LineNumImageText = ((self.tabBarController as? ResultTabBarController)?.LineNumImageText!)!
        LineNum = (self.tabBarController as? ResultTabBarController)?.LineNum!
        Excode = ((self.tabBarController as? ResultTabBarController)?.Excode)!
        //   trainImage.image
        stationNameLabel.text = nameLabelText
        stationLineNumImage.image = UIImage(named: LineNumImageText)
        UIDesignView.line = LineNum!
        CurrentStationNameLabel.text = nameLabelText
        
        print("test")
        ParsingData.beginParsing(nameLabelText)
        
        posLabel.text = ParsingData.posts.objectAtIndex(0).valueForKey("도착정보") as! NSString as String
        destLabel.text = ParsingData.posts.objectAtIndex(0).valueForKey("행선지") as! NSString as String
        posLabel2.text = ParsingData.posts.objectAtIndex(2).valueForKey("도착정보") as! NSString as String
        destLabel2.text = ParsingData.posts.objectAtIndex(2).valueForKey("행선지") as! NSString as String
     
    }
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(50.0, animations: {
            self.trainImage.frame = CGRectMake(256.0 - self.trainImage.frame.size.width/2, 281.0, self.trainImage.frame.size.width, self.trainImage.frame.size.height)
        })
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  }
