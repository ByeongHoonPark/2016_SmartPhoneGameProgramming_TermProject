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
    @IBOutlet weak var CurrentStationLabel2: UILabel!
    @IBOutlet weak var trainImage2: UIImageView!
    var nameLabelText : String = ""
    var LineNumImageText : String = ""
    var LineNum: Int?
    var ParsingData = ParsingInWeb_RealTimeArrival()
    var Excode: String = ""
    
    
    var Upward = [RealTimeInfo]()
    var Downward = [RealTimeInfo]()
    var realtimeinfo = [RealTimeInfo]()
    
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
        CurrentStationLabel2.text = nameLabelText
 
        var trimmedtext: String = nameLabelText
        if nameLabelText.lowercaseString.containsString(String("(경의중앙선)").lowercaseString)
        {
            //encodedString?.removeRange(Range<String.Index>(start: encodedString!.endIndex.advancedBy(-9),end: encodedString!.endIndex))
            //trimmedtext = nameLabelText
            trimmedtext.removeRange(Range<String.Index>(start: trimmedtext.endIndex.advancedBy(-7), end: trimmedtext.endIndex))
            print(trimmedtext)
        }
        ParsingData.beginParsing(trimmedtext)
        
        Upward = ParsingData.RealTimestations.filter({(station: RealTimeInfo) -> Bool in
            return station.updnLine == "상행" || station.updnLine == "외선"
        })
        Downward = ParsingData.RealTimestations.filter({(station: RealTimeInfo) -> Bool in
            return station.updnLine == "하행" || station.updnLine == "내선"
        })
       
        
        for var index in 0 ..< Upward.count
        {
            var line = 0
        
            switch Upward[index].subWayId {
            case "1001":
                line = 1
                
                break
            case "1002":
                line = 2
                break
            case "1003":
                line = 3
                break
            case "1004":
                line = 4
                break
            case "1005":
                line = 5
                break
            case "1006":
                line = 6
                break
            case "1007":
                line = 7
                break
            case "1008":
                line = 8
                break
            case "1009":
                line = 9
                break
            case "1063":
                line = 14
                break
            case "1065":
                line = 15
                break
            case "1067":
                line = 13
                break
            case "1071":
                line = 11
                break
            case "1075":
                line = 11
                break
            case "1077":
                line = 10
                break
            default:
                break
            }
            if LineNum == line
            {
                realtimeinfo.append(Upward[index])
            }
        }
        SetLabel()

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
        
        if posLabel2.text! == "전역 도착"
        {
            print(posLabel2.text!)
            var firsttarin = self.trainImage2.frame
            firsttarin.origin.x = 256 - self.trainImage2.frame.size.width/2
            firsttarin.origin.y = 615
            self.trainImage2.frame = firsttarin
            //self.trainImage
        }
        else if posLabel2.text! == "전역 출발"
        {
            print(posLabel2.text!)
            var firsttarin = self.trainImage2.frame
            firsttarin.origin.x = 256 - self.trainImage2.frame.size.width/2
            firsttarin.origin.y = 615
            self.trainImage2.frame = firsttarin
            UIView.animateWithDuration(70.0, animations: {
                self.trainImage2.frame = CGRectMake(400.0 - self.trainImage2.frame.size.width/2, 615, self.trainImage2.frame.size.width, self.trainImage2.frame.size.height)
            })
            //self.trainImage
        }
        else if posLabel2.text! == "\(stationNameLabel.text!) 도착"
        {
            print(posLabel2.text!)
            var firsttarin = self.trainImage2.frame
            firsttarin.origin.x = 512 - self.trainImage2.frame.size.width/2
            firsttarin.origin.y = 615
            self.trainImage2.frame = firsttarin
            //self.trainImage
        }
        else if posLabel2.text! == "\(stationNameLabel.text!) 진입"
        {
            print(posLabel.text!)
            var firsttarin = self.trainImage2.frame
            firsttarin.origin.x = 400.0 - self.trainImage2.frame.size.width/2
            firsttarin.origin.y = 615
            self.trainImage2.frame = firsttarin
            UIView.animateWithDuration(30.0, animations: {
                self.trainImage2.frame = CGRectMake(512 - self.trainImage2.frame.size.width/2, 615, self.trainImage2.frame.size.width, self.trainImage2.frame.size.height)
            })
            //self.trainImage
        }
        else
        {
            var firsttarin = self.trainImage2.frame
            firsttarin.origin.x = 100 - self.trainImage2.frame.size.width/2
            firsttarin.origin.y = 615
            self.trainImage2.frame = firsttarin
            UIView.animateWithDuration(70.0, animations: {
                self.trainImage2.frame = CGRectMake(256.0 - self.trainImage2.frame.size.width/2, 615, self.trainImage2.frame.size.width, self.trainImage2.frame.size.height)
            })
            
        }
    }
    
    func SetLabel()
    {
        if Upward.count != 0
        {
            posLabel.text = realtimeinfo[0].arriveStatus
            print(realtimeinfo[0].arriveStatus)
            destLabel.text = realtimeinfo[0].trainDestination
            print(realtimeinfo[0].trainDestination)
            
            if realtimeinfo.count > 1
            {
                posLabel2.text = realtimeinfo[1].arriveStatus
                print(realtimeinfo[1].arriveStatus)
                destLabel2.text = realtimeinfo[1].trainDestination
                print(realtimeinfo[1].trainDestination)
            }

        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  }
