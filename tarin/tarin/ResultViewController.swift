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
    
    var nameLabelText : String = ""
    var LineNumImageText : String = ""
    var LineNum: Int?
    var ParsingData = ParsingInWeb_RealTimeArrival()
 
    override func viewDidLoad() {
        super.viewDidLoad()


        //   trainImage.image
        stationNameLabel.text = (self.tabBarController as? ResultTabBarController)?.nameLabelText
        stationLineNumImage.image = UIImage(named: ((self.tabBarController as? ResultTabBarController)?.LineNumImageText)!)
        UIDesignView.line = ((self.tabBarController as? ResultTabBarController)?.LineNum)!
        CurrentStationNameLabel.text = (self.tabBarController as? ResultTabBarController)?.nameLabelText
        
        ParsingData.beginParsing(stationNameLabel.text!)
        print("test")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  }
