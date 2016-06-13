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
    var Excode: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        downStationNameLabel.text = (self.tabBarController as? ResultTabBarController)?.nameLabelText
        downStationLineNumImage.image = UIImage(named: ((self.tabBarController as? ResultTabBarController)?.LineNumImageText)!)
        downUIDesignView.line = ((self.tabBarController as? ResultTabBarController)?.LineNum)!
        Excode = ((self.tabBarController as? ResultTabBarController)?.Excode)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

 }
