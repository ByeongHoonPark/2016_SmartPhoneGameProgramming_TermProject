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
    
    
    var Upward = [RealTimeInfo]()
    var Downward = [RealTimeInfo]()
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
 
        ParsingData.beginParsing(nameLabelText)
        
        Upward = ParsingData.RealTimestations.filter({(station: RealTimeInfo) -> Bool in
            return station.updnLine == "상행" || station.updnLine == "외선"
        })
        Downward = ParsingData.RealTimestations.filter({(station: RealTimeInfo) -> Bool in
            return station.updnLine == "상행" || station.updnLine == "내선"
        })

        posLabel.text = Upward[0].arriveStatus
        print(Upward[0].arriveStatus)
        destLabel.text = ParsingData.posts.objectAtIndex(0).valueForKey("행선지") as! NSString as String
        posLabel2.text = ParsingData.posts.objectAtIndex(2).valueForKey("도착정보") as! NSString as String
        destLabel2.text = ParsingData.posts.objectAtIndex(2).valueForKey("행선지") as! NSString as String
       // ParsingData.posts.filter(<#T##includeElement: (AnyObject) throws -> Bool##(AnyObject) throws -> Bool#>)
        
//        posLabel.text = ParsingData.posts.objectAtIndex(0).valueForKey("도착정보") as! NSString as String
//        destLabel.text = ParsingData.posts.objectAtIndex(0).valueForKey("행선지") as! NSString as String
//        posLabel2.text = ParsingData.posts.objectAtIndex(2).valueForKey("도착정보") as! NSString as String
//        destLabel2.text = ParsingData.posts.objectAtIndex(2).valueForKey("행선지") as! NSString as String
     
    }
    override func viewDidAppear(animated: Bool) {
        if posLabel.text! == "전역 도착"
        {
            print(posLabel.text!)
            var firsttarin = self.trainImage.frame
            firsttarin.origin.x = 256 - self.trainImage.frame.size.width/2
            firsttarin.origin.y = 281
            self.trainImage.frame = firsttarin
            //self.trainImage
        }
        else if posLabel.text! == "전역 출발"
        {
            print(posLabel.text!)
            var firsttarin = self.trainImage.frame
            firsttarin.origin.x = 256 - self.trainImage.frame.size.width/2
            firsttarin.origin.y = 281
            self.trainImage.frame = firsttarin
            UIView.animateWithDuration(70.0, animations: {
                self.trainImage.frame = CGRectMake(400.0 - self.trainImage.frame.size.width/2, 281.0, self.trainImage.frame.size.width, self.trainImage.frame.size.height)
            })
            //self.trainImage
        }
        else if posLabel.text! == "\(stationNameLabel.text!) 도착"
        {
            print(posLabel.text!)
            var firsttarin = self.trainImage.frame
            firsttarin.origin.x = 512 - self.trainImage.frame.size.width/2
            firsttarin.origin.y = 281
            self.trainImage.frame = firsttarin
            //self.trainImage
        }
        else if posLabel.text! == "\(stationNameLabel.text!) 진입"
        {
            print(posLabel.text!)
            var firsttarin = self.trainImage.frame
            firsttarin.origin.x = 400.0 - self.trainImage.frame.size.width/2
            firsttarin.origin.y = 281
            self.trainImage.frame = firsttarin
            UIView.animateWithDuration(30.0, animations: {
                self.trainImage.frame = CGRectMake(512 - self.trainImage.frame.size.width/2, 281.0, self.trainImage.frame.size.width, self.trainImage.frame.size.height)
            })
            //self.trainImage
        }
        else
        {
            var firsttarin = self.trainImage.frame
            firsttarin.origin.x = 100 - self.trainImage.frame.size.width/2
            firsttarin.origin.y = 281
            self.trainImage.frame = firsttarin
            UIView.animateWithDuration(70.0, animations: {
                self.trainImage.frame = CGRectMake(256.0 - self.trainImage.frame.size.width/2, 281.0, self.trainImage.frame.size.width, self.trainImage.frame.size.height)
            })

        }
        
//        UIView.animateWithDuration(50.0, animations: {
//            self.trainImage.frame = CGRectMake(256.0 - self.trainImage.frame.size.width/2, 281.0, self.trainImage.frame.size.width, self.trainImage.frame.size.height)
//        })
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  }
