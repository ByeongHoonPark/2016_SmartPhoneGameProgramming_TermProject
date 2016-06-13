//
//  AboutViewController.swift
//  tarin
//
//  Created by kpugame on 2016. 6. 13..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var Madebyoliver: UITextView!
    @IBOutlet weak var flaticon: UITextView!
    @IBOutlet weak var freepik: UITextView!
    @IBOutlet weak var google: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Madebyoliver.linkTextAttributes = [NSForegroundColorAttributeName: UIColor.blueColor(), NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue]
        Madebyoliver.editable = false
        Madebyoliver.dataDetectorTypes = .All
        Madebyoliver.text = "http://www.flaticon.com/authors/madebyoliver"
        flaticon.linkTextAttributes = [NSForegroundColorAttributeName: UIColor.blueColor(), NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue]
        flaticon.editable = false
        flaticon.dataDetectorTypes = .All
        flaticon.text = "Flaticon\n" + "http://www.flaticon.com/"
        freepik.linkTextAttributes = [NSForegroundColorAttributeName: UIColor.blueColor(), NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue]
        freepik.editable = false
        freepik.dataDetectorTypes = .All
        freepik.text = "http://www.flaticon.com/authors/freepik"
        google.linkTextAttributes = [NSForegroundColorAttributeName: UIColor.blueColor(), NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue]
        google.editable = false
        google.dataDetectorTypes = .All
        google.text = "http://www.flaticon.com/authors/google"
        
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
