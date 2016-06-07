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
    override func viewDidLoad() {
        super.viewDidLoad()
        detailNameLabel.text = (self.tabBarController as? ResultTabBarController)?.nameLabelText
        detailLineImage.image = UIImage(named: ((self.tabBarController as? ResultTabBarController)?.LineNumImageText)!)
        detailUIDesignView.line = ((self.tabBarController as? ResultTabBarController)?.LineNum)!
       }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
