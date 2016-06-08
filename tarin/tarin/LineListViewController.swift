//
//  LineListViewController.swift
//  tarin
//
//  Created by kpugame on 2016. 6. 8..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import UIKit

class LineListViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! LineStaionViewController
        if segue.identifier == "LineOne"{
            destination.lineNum = 1
            destination.stringLineNum = "1"
            destination.LineNumImageText = "1.png"
        }
        if segue.identifier == "LineTwo"{
            destination.lineNum = 2
            destination.stringLineNum = "2"
            destination.LineNumImageText = "2.png"
            
        }
        if segue.identifier == "LineThree"{
            destination.lineNum = 3
            destination.stringLineNum = "3"
            destination.LineNumImageText = "3.png"
            
        }
        if segue.identifier == "LineFour"{
            destination.lineNum = 4
            destination.stringLineNum = "4"
            destination.LineNumImageText = "4.png"
        }
        if segue.identifier == "LineFive"{
            destination.lineNum = 5
            destination.stringLineNum = "5"
            destination.LineNumImageText = "5.png"
        }
        if segue.identifier == "LineSix"{
            destination.lineNum = 6
            destination.stringLineNum = "6"
            destination.LineNumImageText = "6.png"
        }
        if segue.identifier == "LineSeven"{
            destination.lineNum = 7
            destination.stringLineNum = "7"
            destination.LineNumImageText = "7.png"
        }
        if segue.identifier == "LineEight"{
            destination.lineNum = 8
            destination.stringLineNum = "8"
            destination.LineNumImageText = "8.png"
        }
        if segue.identifier == "LineNine"{
            destination.lineNum = 9
            destination.stringLineNum = "9"
            destination.LineNumImageText = "9.png"
        }
        if segue.identifier == "LineS"{
            destination.lineNum = 10
            destination.stringLineNum = "신분당선"
            destination.LineNumImageText = "신분당선.png"
        }
        if segue.identifier == "LineSU"{
            destination.lineNum = 11
            destination.stringLineNum = "수인선"
            destination.LineNumImageText = "수인선.png"
        }
        if segue.identifier == "LineB"{
            destination.lineNum = 11
            destination.stringLineNum = "분당선"
            destination.LineNumImageText = "분당선.png"
        }
        if segue.identifier == "LineI"{
            destination.lineNum = 12
            destination.stringLineNum = "인천지하철 1호선"
            destination.LineNumImageText = "인천지하철 1호선.png"
        }
        if segue.identifier == "LineK"{
            destination.lineNum = 13
            destination.stringLineNum = "경춘선"
            destination.LineNumImageText = "경춘선.png"
        }
        if segue.identifier == "LineKJ"{
            destination.lineNum = 14
            destination.stringLineNum = "경의중앙선"
            destination.LineNumImageText = "경의중앙선.png"
        }
        if segue.identifier == "LineA"{
            destination.lineNum = 15
            destination.stringLineNum = "공항철도"
            destination.LineNumImageText = "공항철도.png"
        }
        if segue.identifier == "LineU"{
            destination.lineNum = 16
            destination.stringLineNum = "의정부경전철"
            destination.LineNumImageText = "의정부경전철.png"
        }
        if segue.identifier == "LineE"{
            destination.lineNum = 17
            destination.stringLineNum = "에버라인"
            destination.LineNumImageText = "에버라인.png"
        }        
        
    }
    
    
}
