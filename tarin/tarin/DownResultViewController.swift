//
//  DownResultViewController.swift
//  tarin
//
//  Created by kpugame on 2016. 6. 8..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import UIKit

class DownResultViewController: UIViewController {

    
    @IBOutlet weak var downStationNameLabel: UILabel!
    @IBOutlet weak var downStationLineNumImage: UIImageView!
    @IBOutlet weak var downUIDesignView: DetailLineView!
    @IBOutlet weak var downDestLabel: UILabel!
    @IBOutlet weak var downCurrentStateLabel: UILabel!
    @IBOutlet weak var downCurrentStationNameLabel: UILabel!
    @IBOutlet weak var destLabel2: UILabel!
    @IBOutlet weak var currentStateLabel2: UILabel!
    @IBOutlet weak var currentStationLabel2: UILabel!
    @IBOutlet weak var tarinImage2: UIImageView!
    @IBOutlet weak var trainImage: UIImageView!
    
    var ParsingData = ParsingInWeb_RealTimeArrival()
    var Excode: String = ""
    var LineNum: Int?
    var Upward = [RealTimeInfo]()
    var Downward = [RealTimeInfo]()
    var realtimeinfo = [RealTimeInfo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downStationNameLabel.text = (self.tabBarController as? ResultTabBarController)?.nameLabelText
        downStationLineNumImage.image = UIImage(named: ((self.tabBarController as? ResultTabBarController)?.LineNumImageText)!)
        downUIDesignView.line = ((self.tabBarController as? ResultTabBarController)?.LineNum)!
        Excode = ((self.tabBarController as? ResultTabBarController)?.Excode)!
        
        LineNum = (self.tabBarController as? ResultTabBarController)?.LineNum!
        downCurrentStationNameLabel.text = downStationNameLabel.text
        currentStationLabel2.text = downStationNameLabel.text

        
        var trimmedtext: String = downCurrentStationNameLabel.text!
        if downCurrentStationNameLabel.text!.lowercaseString.containsString(String("(경의중앙선)").lowercaseString)
        {
            trimmedtext.removeRange(Range<String.Index>(start: trimmedtext.endIndex.advancedBy(-7), end: trimmedtext.endIndex))
        }
        ParsingData.beginParsing(trimmedtext)
        
        Upward = ParsingData.RealTimestations.filter({(station: RealTimeInfo) -> Bool in
            return station.updnLine == "상행" || station.updnLine == "외선"
        })
        Downward = ParsingData.RealTimestations.filter({(station: RealTimeInfo) -> Bool in
            return station.updnLine == "하행" || station.updnLine == "내선"
        })
        
        for var index in 0 ..< Downward.count
        {
            var line = 0
            
            switch Downward[index].subWayId {
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
                realtimeinfo.append(Downward[index])
            }
        }
        SetLabel()
    }
    override func viewDidAppear(animated: Bool) {
        if downCurrentStateLabel.text! == "전역 도착"
        {
            print(downCurrentStateLabel.text!)
            var firsttarin = self.trainImage.frame
            firsttarin.origin.x = 256 - self.trainImage.frame.size.width/2
            firsttarin.origin.y = 281
            self.trainImage.frame = firsttarin
        }
        else if downCurrentStateLabel.text! == "전역 출발"
        {
            print(downCurrentStateLabel.text!)
            var firsttarin = self.trainImage.frame
            firsttarin.origin.x = 256 - self.trainImage.frame.size.width/2
            firsttarin.origin.y = 281
            self.trainImage.frame = firsttarin
            UIView.animateWithDuration(70.0, animations: {
                self.trainImage.frame = CGRectMake(400.0 - self.trainImage.frame.size.width/2, 281.0, self.trainImage.frame.size.width, self.trainImage.frame.size.height)
            })
        }
        else if downCurrentStateLabel.text! == "\(downStationNameLabel.text!) 도착"
        {
            print(downCurrentStateLabel.text!)
            var firsttarin = self.trainImage.frame
            firsttarin.origin.x = 512 - self.trainImage.frame.size.width/2
            firsttarin.origin.y = 281
            self.trainImage.frame = firsttarin
        }
        else if downCurrentStateLabel.text! == "\(downStationNameLabel.text!) 진입"
        {
            print(downCurrentStateLabel.text!)
            var firsttarin = self.trainImage.frame
            firsttarin.origin.x = 400.0 - self.trainImage.frame.size.width/2
            firsttarin.origin.y = 281
            self.trainImage.frame = firsttarin
            UIView.animateWithDuration(30.0, animations: {
                self.trainImage.frame = CGRectMake(512 - self.trainImage.frame.size.width/2, 281.0, self.trainImage.frame.size.width, self.trainImage.frame.size.height)
            })
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
        
        if currentStateLabel2.text! == "전역 도착"
        {
            print(currentStateLabel2.text!)
            var firsttarin = self.tarinImage2.frame
            firsttarin.origin.x = 256 - self.tarinImage2.frame.size.width/2
            firsttarin.origin.y = 620
            self.tarinImage2.frame = firsttarin
        }
        else if currentStateLabel2.text! == "전역 출발"
        {
            print(currentStateLabel2.text!)
            var firsttarin = self.tarinImage2.frame
            firsttarin.origin.x = 256 - self.tarinImage2.frame.size.width/2
            firsttarin.origin.y = 620
            self.tarinImage2.frame = firsttarin
            UIView.animateWithDuration(70.0, animations: {
                self.tarinImage2.frame = CGRectMake(400.0 - self.tarinImage2.frame.size.width/2, 620, self.tarinImage2.frame.size.width, self.tarinImage2.frame.size.height)
            })
        }
        else if currentStateLabel2.text! == "\(downStationNameLabel.text!) 도착"
        {
            print(downCurrentStateLabel.text!)
            var firsttarin = self.tarinImage2.frame
            firsttarin.origin.x = 512 - self.tarinImage2.frame.size.width/2
            firsttarin.origin.y = 620
            self.tarinImage2.frame = firsttarin
        }
        else if currentStateLabel2.text! == "\(downStationNameLabel.text!) 진입"
        {
            print(currentStateLabel2.text!)
            var firsttarin = self.tarinImage2.frame
            firsttarin.origin.x = 400.0 - self.tarinImage2.frame.size.width/2
            firsttarin.origin.y = 620
            self.tarinImage2.frame = firsttarin
            UIView.animateWithDuration(30.0, animations: {
                self.tarinImage2.frame = CGRectMake(512 - self.tarinImage2.frame.size.width/2, 620, self.tarinImage2.frame.size.width, self.tarinImage2.frame.size.height)
            })
        }
        else
        {
            var firsttarin = self.tarinImage2.frame
            firsttarin.origin.x = 100 - self.tarinImage2.frame.size.width/2
            firsttarin.origin.y = 620
            self.tarinImage2.frame = firsttarin
            UIView.animateWithDuration(70.0, animations: {
                self.tarinImage2.frame = CGRectMake(256.0 - self.tarinImage2.frame.size.width/2, 620, self.tarinImage2.frame.size.width, self.tarinImage2.frame.size.height)
            })
        }

    }
    func SetLabel()
    {
        if Downward.count != 0
        {
            downCurrentStateLabel.text = realtimeinfo[0].arriveStatus
            print(realtimeinfo[0].arriveStatus)
            downDestLabel.text = realtimeinfo[0].trainDestination
            print(realtimeinfo[0].trainDestination)
            if realtimeinfo.count > 1
            {
                currentStateLabel2.text = realtimeinfo[1].arriveStatus
                print(realtimeinfo[1].arriveStatus)
                destLabel2.text = Downward[1].trainDestination
                print(realtimeinfo[1].trainDestination)
            }

        }
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

 }
