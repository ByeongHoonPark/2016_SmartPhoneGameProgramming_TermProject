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
    //var index : Int
    // var latitude : Float // wi do
    //var longtitude : Float // kyung do
    
    init(name: String, externalCode: String, lineNumber: String, imageName: String)
    {
        self.name = name
        self.externalCode   = externalCode
        self.lineNumber = lineNumber
        self.imageName = imageName
      //  self.index = index
    }
}