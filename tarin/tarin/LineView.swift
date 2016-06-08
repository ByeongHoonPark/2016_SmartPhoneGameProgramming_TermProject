//
//  LineView.swift
//  tarin
//
//  Created by kpugame on 2016. 6. 6..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import UIKit
@IBDesignable
class LineView: UIView {

    @IBInspectable var lineColor: UIColor = UIColor(red: 255, green: 255, blue: 255, alpha: 255)
    @IBInspectable var line: Int = 0
    
    override func drawRect(rect: CGRect) {
        switch line {
        case 1:
            lineColor = UIColor(red: 0, green: 101/255, blue: 179/255, alpha: 255)
            break
        case 2:
            lineColor = UIColor(red: 0, green: 146/255, blue: 70/255, alpha: 255)
            break
        case 3:
            lineColor = UIColor(red: 243/255, green: 102/255, blue: 48/255, alpha: 255)
            break
        case 4:
            lineColor = UIColor(red: 0, green: 162/255, blue: 209/255, alpha: 255)
            break
        case 5:
            lineColor = UIColor(red: 160/255, green: 100/255, blue: 163/255, alpha: 255)
            break
        case 6:
            lineColor = UIColor(red: 158/255, green: 69/255, blue: 16/255, alpha: 255)
            break
        case 7:
            lineColor = UIColor(red: 93/255, green: 101/255, blue: 25/255, alpha: 255)
            break
        case 8:
            lineColor = UIColor(red: 214/255, green: 64/255, blue: 106/255, alpha: 255)
            break
        case 9:
            lineColor = UIColor(red: 142/255, green: 118/255, blue: 75/255, alpha: 255)
            break
        case 10: // 신분당선
            lineColor = UIColor(red: 187/255, green: 24/255, blue: 51/255, alpha: 255)
            break
        case 11: // 수인 분당
            lineColor = UIColor(red: 224/255, green: 161/255, blue: 52/255, alpha: 255)
            break
        case 12: // 인천1호
            lineColor = UIColor(red: 110/255, green: 152/255, blue: 187/255, alpha: 255)
            break
        case 13: // 경춘선
            lineColor = UIColor(red: 42/255, green: 191/255, blue: 208/255, alpha: 255)
            break
        case 14: // 경의중앙
            lineColor = UIColor(red: 114/255, green: 199/255, blue: 166/255, alpha: 255)
            break
        case 15: // 공항철도
            lineColor = UIColor(red: 0, green: 109/255, blue: 157/255, alpha: 255)
            break
        case 16:// 의정부 경전철
            lineColor = UIColor(red: 255/255, green: 133/255, blue: 13/255, alpha: 255)
            break
        case 17:// 에버라인
            lineColor = UIColor(red: 80/255, green: 159/255, blue: 34/255, alpha: 255)
            break
        default:
            break
        }
        let path =
            UIBezierPath(ovalInRect:
                CGRect(origin: CGPoint(x: bounds.width/2-63.0,y: 0), size: CGSize(width: 125.0, height: 125.0))
                )
        let temp =
                CGRect(origin: CGPoint(x: 0,y: bounds.height/2 - 23.0), size: CGSize(width: 70.0, height: 45.0))
        let temp2 =
            CGRect(origin: CGPoint(x: bounds.width/2 + 50,y: bounds.height/2 - 23.0), size: CGSize(width: 70.0, height: 45.0))
        lineColor.setFill()
        path.fill()
        UIRectFill(temp)
        UIRectFill(temp2)
        

        
    }

}

@IBDesignable
class DetailLineView: UIView {
    
    @IBInspectable var lineColor: UIColor = UIColor(red: 255, green: 255, blue: 255, alpha: 255)
    @IBInspectable var line: Int = 1
    
    override func drawRect(rect: CGRect) {
        switch line {
        case 1:
            lineColor = UIColor(red: 0, green: 101/255, blue: 179/255, alpha: 255)
            break
        case 2:
            lineColor = UIColor(red: 0, green: 146/255, blue: 70/255, alpha: 255)
            break
        case 3:
            lineColor = UIColor(red: 243/255, green: 102/255, blue: 48/255, alpha: 255)
            break
        case 4:
            lineColor = UIColor(red: 0, green: 162/255, blue: 209/255, alpha: 255)
            break
        case 5:
            lineColor = UIColor(red: 160/255, green: 100/255, blue: 163/255, alpha: 255)
            break
        case 6:
            lineColor = UIColor(red: 158/255, green: 69/255, blue: 16/255, alpha: 255)
            break
        case 7:
            lineColor = UIColor(red: 93/255, green: 101/255, blue: 25/255, alpha: 255)
            break
        case 8:
            lineColor = UIColor(red: 214/255, green: 64/255, blue: 106/255, alpha: 255)
            break
        case 9:
            lineColor = UIColor(red: 142/255, green: 118/255, blue: 75/255, alpha: 255)
            break
        case 10: // 신분당선
            lineColor = UIColor(red: 187/255, green: 24/255, blue: 51/255, alpha: 255)
            break
        case 11: // 수인 분당
            lineColor = UIColor(red: 224/255, green: 161/255, blue: 52/255, alpha: 255)
            break
        case 12: // 인천1호
            lineColor = UIColor(red: 110/255, green: 152/255, blue: 187/255, alpha: 255)
            break
        case 13: // 경춘선
            lineColor = UIColor(red: 42/255, green: 191/255, blue: 208/255, alpha: 255)
            break
        case 14: // 경의중앙
            lineColor = UIColor(red: 114/255, green: 199/255, blue: 166/255, alpha: 255)
            break
        case 15: // 공항철도
            lineColor = UIColor(red: 0, green: 109/255, blue: 157/255, alpha: 255)
            break
        case 16:// 의정부 경전철
            lineColor = UIColor(red: 255/255, green: 133/255, blue: 13/255, alpha: 255)
            break
        case 17:// 에버라인
            lineColor = UIColor(red: 80/255, green: 159/255, blue: 34/255, alpha: 255)
            break
        default:
            break
        }
        let leftSemiCircle =
            UIBezierPath(arcCenter: CGPoint(x:200,y:bounds.height/2), radius: 60.0, startAngle: CGFloat(M_PI_2), endAngle: CGFloat(M_PI)*1.5, clockwise: true)
        let rightSemiCircle =
            UIBezierPath(arcCenter: CGPoint(x:bounds.width / 2 + 200,y:bounds.height/2), radius: 60.0, startAngle: CGFloat(M_PI)*1.5, endAngle: CGFloat(M_PI_2), clockwise: true)
        let temp =
            CGRect(origin: CGPoint(x: 0,y: bounds.height/2 - 30), size: CGSize(width: 150.0, height: 60.0))
        let temp2 =
            CGRect(origin: CGPoint(x: bounds.width/2 + 250,y: bounds.height/2 - 30.0), size: CGSize(width: 150.0, height: 60.0))
        let outtercenterRect =
            CGRect(origin: CGPoint(x: bounds.width/2 - 190,y: 0.0), size: CGSize(width: 390.0, height: 120.0))
        
        lineColor.setFill()
        leftSemiCircle.fill()
        rightSemiCircle.fill()
        UIRectFill(temp)
        UIRectFill(temp2)
        UIRectFill(outtercenterRect)
        
        let innerleftSemiCircle =
            UIBezierPath(arcCenter: CGPoint(x:200,y:bounds.height/2), radius: 40.0, startAngle: CGFloat(M_PI_2), endAngle: CGFloat(M_PI)*1.5, clockwise: true)
        let innerrightSemiCircle =
            UIBezierPath(arcCenter: CGPoint(x:bounds.width / 2 + 200,y:bounds.height/2), radius: 40.0, startAngle: CGFloat(M_PI)*1.5, endAngle: CGFloat(M_PI_2), clockwise: true)
        
        UIColor.whiteColor().setFill()
        innerleftSemiCircle.fill()
        innerrightSemiCircle.fill()
        
        let innercenterRect =
            CGRect(origin: CGPoint(x: bounds.width/2 - 190,y: 20.0), size: CGSize(width: 390.0, height: 80.0))

        UIRectFill(innercenterRect)
        
    }
    
    
}

