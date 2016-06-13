//
//  MapViewController.swift
//  tarin
//
//  Created by kpugame on 2016. 6. 12..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import UIKit
struct WGSPosition {
    var latitude: Double
    var longitude: Double
}
class MapViewController: UIViewController, MTMapViewDelegate {

    var mapView: MTMapView?
     let GetParsing = parsingData()
    let stationInfoParsig = parsingData()
    var latitude: Double?
    var longitude: Double?
    var stationAddress: String?
    var stationName: String?
    var stationExcode: String?
    var stationTelephoneNum: String?
    var stationFax: String?
    var infoTesk: Bool? // 관광안내소
    var obstacle: Bool? // 장애인 시설
    var meetplace: Bool? // 만남의장소
    var bycicle: Bool? // 자전거 보관소
    var nursing: Bool? // 수유시설
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mapView = MTMapView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        mapView!.daumMapApiKey = "5a8636130ec4d2a4176176ec9701ab74"
        
        mapView!.delegate = self
        mapView!.baseMapType = MTMapType.Standard
        mapView!.useHDMapTile = true
        
       getStationData()
        
        mapView!.setMapCenterPoint(MTMapPoint(geoCoord: MTMapPointGeo(latitude: latitude!, longitude: longitude!)),zoomLevel: 0, animated: true)
        
//        let pin = MTMapPOIItem()
//        pin.itemName = stationName!
//        pin.mapPoint = MTMapPoint(geoCoord: MTMapPointGeo(latitude: latitude!, longitude: longitude!))
//        pin.markerType = MTMapPOIItemMarkerType.BluePin
//        pin.showAnimationType = MTMapPOIItemShowAnimationType.DropFromHeaven
//        pin.draggable = true
//        //pin.tag = 153
//        
//        mapView?.addPOIItem(pin)
//        mapView?.fitMapViewAreaToShowAllPOIItems()
        self.view.addSubview(mapView!)
   
        // Do any additional setup after loading the view.
    }
    
    func getStationData()
    {
       //http://openapi.seoul.go.kr:8088/47657a4e6a65657036396d56717a4d/xml/SearchSTNInfoByFRCodeService/1/5/\(stationExcode)/
        //let encodedName = UTF8Encode(stationExcode!)
        if stationExcode != nil
        {
            //let station = String(stationExcode)
            //print(station)
            let siteURL = "http://openapi.seoul.go.kr:8088/47657a4e6a65657036396d56717a4d/xml/SearchSTNInfoByFRCodeService/1/5/\(stationExcode!)/"
            latitude = Double(GetParsing.beginParsing(siteURL, motherData: "row", ChildData: "XPOINT_WGS", DataNum: 0))!
            longitude = Double(GetParsing.beginParsing(siteURL, motherData: "row", ChildData: "YPOINT_WGS", DataNum: 0))!
            
            print("latitude : \(latitude)")
            print("longitude : \(longitude)")

        }
           //  return position
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        mapView!.didReceiveMemoryWarning()
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
