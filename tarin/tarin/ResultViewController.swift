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

    var nameLabelText : String = ""
    var LineNumImageText : String = ""
    var LineNum: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stationNameLabel.text = (self.tabBarController as? ResultTabBarController)?.nameLabelText//nameLabelText
        stationLineNumImage.image = UIImage(named: ((self.tabBarController as? ResultTabBarController)?.LineNumImageText)!) //UIImage(named: LineNumImageText)
        UIDesignView.line = ((self.tabBarController as? ResultTabBarController)?.LineNum)!//LineNum!
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  }
