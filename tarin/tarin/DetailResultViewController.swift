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
    var Excode: String = ""
    var nameLabelText : String = ""
    var LineNumImageText : String = ""
    var LineNum: Int?
    var stationTelephoneNum: String!
    var stationFax: String!
    var infoTesk: String! // 관광안내소
    var obstacle: String! // 장애인 시설
    var meetplace: String! // 만남의장소
    var bycicle: String! // 자전거 보관소
    var nursing: String! // 수유시설
    var elevator: String!  // 엘리베이터
    var GetParsing = parsingData()
    var latitude: Double!
    var longitude: Double!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailNameLabel.text = (self.tabBarController as? ResultTabBarController)?.nameLabelText
        detailLineImage.image = UIImage(named: ((self.tabBarController as? ResultTabBarController)?.LineNumImageText)!)
        detailUIDesignView.line = ((self.tabBarController as? ResultTabBarController)?.LineNum)!
        Excode = ((self.tabBarController as? ResultTabBarController)?.Excode)!
        getStationData()
       }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "seeMap"{
            let destination = segue.destinationViewController as! MapViewController
            destination.stationName = detailNameLabel.text
            destination.stationExcode = Excode
            //destination.StartStationName = StartStationName
            //destination.selectMode = 1
        }
    }
    
    func getStationData()
    {
        //http://openapi.seoul.go.kr:8088/47657a4e6a65657036396d56717a4d/xml/SearchSTNInfoByFRCodeService/1/5/\(stationExcode)/
        //let encodedName = UTF8Encode(stationExcode!)
        if Excode != ""
        {
            //let station = String(stationExcode)
            //print(station)
            let siteURL = "http://openapi.seoul.go.kr:8088/47657a4e6a65657036396d56717a4d/xml/SearchSTNInfoByFRCodeService/1/5/\(Excode)/"
            latitude = Double(GetParsing.beginParsing(siteURL, motherData: "row", ChildData: "XPOINT_WGS", DataNum: 0))!
            longitude = Double(GetParsing.beginParsing(siteURL, motherData: "row", ChildData: "YPOINT_WGS", DataNum: 0))!
            
            stationTelephoneNum = GetParsing.beginParsing(siteURL, motherData: "row", ChildData: "TEL", DataNum: 0)
            stationFax = GetParsing.beginParsing(siteURL, motherData: "row", ChildData: "FAX", DataNum: 0)
            if (GetParsing.beginParsing(siteURL, motherData: "row", ChildData: "INFOTESK", DataNum: 0) == "Y"){
                infoTesk = "있음"
            }
            else{
                infoTesk = "없음"
            }
            if (GetParsing.beginParsing(siteURL, motherData: "row", ChildData: "OBSTACLE", DataNum: 0) == "Y"){
                obstacle = "있음"
            }
            else{
                obstacle = "없음"
            }
            if (GetParsing.beginParsing(siteURL, motherData: "row", ChildData: "MEETPLACE", DataNum: 0) == "Y"){
                meetplace = "있음"
            }
            else{
                meetplace = "없음"
            }
            if (GetParsing.beginParsing(siteURL, motherData: "row", ChildData: "BICYCLE", DataNum: 0) == "Y"){
                bycicle = "있음"
            }
            else{
                bycicle = "없음"
            }
            if (GetParsing.beginParsing(siteURL, motherData: "row", ChildData: "NURSING", DataNum: 0) == "Y"){
                nursing = "있음"
            }
            else{
                nursing = "없음"
            }
            if (GetParsing.beginParsing(siteURL, motherData: "row", ChildData: "ELEVATOR", DataNum: 0) == "Y"){
                elevator = "있음"
            }
            else{
                elevator = "없음"
            }
            
            
//            infoTesk = GetParsing.beginParsing(siteURL, motherData: "row", ChildData: "INFOTESK", DataNum: 0)// 관광안내소
//            obstacle = GetParsing.beginParsing(siteURL, motherData: "row", ChildData: "OBSTACLE", DataNum: 0)// 장애인 시설
//            meetplace = GetParsing.beginParsing(siteURL, motherData: "row", ChildData: "MEETPLACE", DataNum: 0)// 만남의장소
//            bycicle = GetParsing.beginParsing(siteURL, motherData: "row", ChildData: "BICYCLE", DataNum: 0)// 자전거 보관소
//            nursing = GetParsing.beginParsing(siteURL, motherData: "row", ChildData: "NURSING", DataNum: 0)// 수유시설

            
            
            print("관광안내소 : \(infoTesk)")
            print("장애인시설 : \(obstacle)")
            print("만남의장소 : \(meetplace)")
            print("자전거보관소 : \(bycicle)")
            print("수유방 : \(nursing)")
            print("엘레베이터 : \(elevator)")
            print("latitude : \(latitude)")
            print("longitude : \(longitude)")
            print("전화번호 : \(stationTelephoneNum)")
            print("팩스번호 : \(stationFax)")
            
            
            
        }
        //  return position
    }


}
