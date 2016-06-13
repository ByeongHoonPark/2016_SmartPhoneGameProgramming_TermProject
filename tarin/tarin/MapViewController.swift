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
    var stationExcode: String?
    var stationName: String?
    var stationAddress: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MTMapView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        mapView!.daumMapApiKey = "5a8636130ec4d2a4176176ec9701ab74"
        mapView!.delegate = self
        mapView!.baseMapType = MTMapType.Standard
        mapView!.useHDMapTile = true
        getStationData()
        mapView!.setMapCenterPoint(MTMapPoint(geoCoord: MTMapPointGeo(latitude: latitude!, longitude: longitude!)),zoomLevel: 0, animated: true)
        self.view.addSubview(mapView!)
    }
    
    func getStationData()
    {
       //http://openapi.seoul.go.kr:8088/47657a4e6a65657036396d56717a4d/xml/SearchSTNInfoByFRCodeService/1/5/\(stationExcode)/
        if stationExcode != nil
        {
            let siteURL = "http://openapi.seoul.go.kr:8088/47657a4e6a65657036396d56717a4d/xml/SearchSTNInfoByFRCodeService/1/5/\(stationExcode!)/"
            latitude = Double(GetParsing.beginParsing(siteURL, motherData: "row", ChildData: "XPOINT_WGS", DataNum: 0))!
            longitude = Double(GetParsing.beginParsing(siteURL, motherData: "row", ChildData: "YPOINT_WGS", DataNum: 0))!
            
            print("latitude : \(latitude)")
            print("longitude : \(longitude)")

        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        mapView!.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
