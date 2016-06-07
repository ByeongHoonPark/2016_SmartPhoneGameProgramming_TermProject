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
    
    @IBOutlet weak var downStationNameLabel: UILabel!
    @IBOutlet weak var downStationLineNumImage: UIImageView!
    @IBOutlet weak var downUIDesignView: DetailLineView!
  //  override var tabBarController: UITabBarController?
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailLineImage: UIImageView!
    @IBOutlet weak var detailUIDesignView: DetailLineView!
    //@IBOutlet weak var stationNameLabel: UILabel!
    //@IBOutlet weak var stationLineNumImage: UIImageView!
    //@IBOutlet weak var UIDesignView: DetailLineView!
    var nameLabelText : String = ""
    var LineNumImageText : String = ""
    var LineNum: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(nameLabelText)
        stationNameLabel.text = nameLabelText
        stationLineNumImage.image = UIImage(named: LineNumImageText)
        UIDesignView.line = LineNum!
        
       // downStationNameLabel.text =
       // downStationLineNumImage.image = UIImage(named: LineNumImageText)
       // downUIDesignView.line = LineNum!
        
       // detailNameLabel.text = nameLabelText
       // detailLineImage.image = UIImage(named: LineNumImageText)
      //  detailUIDesignView.line = LineNum!
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
