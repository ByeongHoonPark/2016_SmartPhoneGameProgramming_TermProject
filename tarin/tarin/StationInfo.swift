//
//  StationInfo.swift
//  tarin
//
//  Created by kpugame on 2016. 6. 7..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import Foundation
class StationInfo{
    var name : String
    var externalCode: String
    var lineNumber : String
    var imageName : String
    
    init(name: String, externalCode: String, lineNumber: String, imageName: String)
    {
        self.name = name
        self.externalCode   = externalCode
        self.lineNumber = lineNumber
        self.imageName = imageName
    }
}
class RealTimeInfo{
    
    var subWayId : String
    var updnLine : String
    var trainDestination: String
    var trainKind : String
    var stationName : String
    var arriveStatus : String
    var arriveTime : String
    var arriveStatus2 : String
    
    init(subWayId : String,updnLine : String,trainDestination: String,trainKind : String,stationName : String,arriveStatus : String,arriveTime : String,arriveStatus2 : String)
    {
       self.subWayId = subWayId
        self.updnLine = updnLine
        self.trainDestination = trainDestination
        self.trainKind = trainKind
        self.stationName = stationName
        self.arriveStatus = arriveStatus
        self.arriveStatus2 = arriveStatus2
        self.arriveTime = arriveTime
    }
}

class TransferInfo{
    var StartStation : String
    var DestStation : String
    var ShortTimeStatonList : Array<String>
    var ShortTimeTransferInfo : String
    
    
    var ShortTransferStatonList : Array<String>
    var ShortTransferTransferInfo : String
    
    init(StartStation : String,DestStation : String,ShortTimeStatonList: Array<String>,ShortTimeTransferInfo : String,ShortTransferStatonList : Array<String>,ShortTransferTransferInfo : String)
    {
        self.StartStation = StartStation
        self.DestStation = DestStation
        self.ShortTimeStatonList = ShortTimeStatonList
        self.ShortTimeTransferInfo = ShortTimeTransferInfo
        self.ShortTransferStatonList = ShortTransferStatonList
        self.ShortTransferTransferInfo = ShortTransferTransferInfo

    }

}