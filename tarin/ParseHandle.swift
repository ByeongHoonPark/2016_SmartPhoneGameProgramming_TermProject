//
//  ParseHandle.swift
//  tarin
//
//  Created by kpugame on 2016. 6. 6..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import Foundation

class ParsingInWeb_RealTimeArrival: NSObject, NSXMLParserDelegate{
    var parser = NSXMLParser()
    
    var posts = NSMutableArray()
    
    var elements = NSMutableDictionary()
    var element = NSString()
    
    var parsingData = NSMutableString()
    var subWayId = NSMutableString()
    var updnLine = NSMutableString()
    var trainDestination = NSMutableString()
    var trainKind = NSMutableString()
    var stationName = NSMutableString()
//    var arriveTimestring = NSMutableString()
    var arriveStatus = NSMutableString()
    var arriveTime = NSMutableString()
    var arriveStatus2 = NSMutableString()
   var returnData: String = ""
    var url = String()
     var RealTimestations = [RealTimeInfo]()
    
    func beginParsing(stationname: String)
    {
        
        posts = NSMutableArray()
        posts = []
        
        let original = String("http://swopenAPI.seoul.go.kr/api/subway/785943436365657038384c4f4e7078/xml/realtimeStationArrival/0/5/\(stationname)")
        var encodedString = original.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        //encodedString?.removeRange(Range<String.Index>(start: encodedString!.endIndex.advancedBy(-6),end: encodedString!.endIndex))

     //   url = "http://swopenAPI.seoul.go.kr/api/subway/785943436365657038384c4f4e7078/xml/realtimeStationArrival/0/5/\(stationname)"
     //   url = url.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLPathAllowedCharacterSet())!
     //   url = url.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        parser = NSXMLParser(contentsOfURL: NSURL(string: encodedString!)!)!
        parser.delegate = self
        parser.parse()
        
    }
    
    func parser(parser:NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?,
                attributes attributeDict: [String : String])
    {
        element = elementName
        
        if(elementName as NSString).isEqualToString("row")
        {
            elements = NSMutableDictionary()
            elements = [:]
            subWayId = NSMutableString()
            subWayId = ""
            updnLine = NSMutableString()
            updnLine = ""
            stationName = NSMutableString()
            stationName = ""
            trainDestination = NSMutableString()
            trainDestination = ""
            trainKind = NSMutableString()
            trainKind = ""

            arriveStatus = NSMutableString()
            arriveStatus = ""
            arriveTime = NSMutableString()
            arriveTime = ""
            arriveStatus2 = NSMutableString()
            arriveStatus2 = ""
            
            
        }
    }
    
    func parser(parser: NSXMLParser!, foundCharacters string: String!)
    {
        if element.isEqualToString("subwayId")
        {
            //string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            subWayId.appendString(string)
        }
        else if element.isEqualToString("statnNm")
        {
            //string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            stationName.appendString(string)
        }
        else if element.isEqualToString("updnLine")
        {
            //string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            updnLine.appendString(string)
        }
        else if element.isEqualToString("trainLineNm")
        {
            //string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            trainDestination.appendString(string)
        }
        else if element.isEqualToString("bstatnNm")
        {
            //string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            trainKind.appendString(string)

        }
        else if element.isEqualToString("arvlMsg2")
        {
            //string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            arriveStatus.appendString(string)
        }
        else if element.isEqualToString("barvlDt")
        {
            //string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            arriveTime.appendString(string)
        }
        else if element.isEqualToString("arvlCd")
        {
            //string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            var arrivalCode = string
            if arrivalCode == "0"
            {
                arrivalCode = "이번역 진입"
            }
            else if arrivalCode == "1"
            {
                arrivalCode = "도착"
            }
            else if arrivalCode == "2"
            {
                arrivalCode = "출발"
            }
            else if arrivalCode == "3"
            {
                 arrivalCode = "전역 출발"
            }
            else if arrivalCode == "4"
            {
                 arrivalCode = "전역 진입"
            }
            else if arrivalCode == "5"
            {
                arrivalCode = "전역 도착"
            }
            else if arrivalCode == "99"
            {
                 arrivalCode = " "
            }
            arriveStatus2.appendString(arrivalCode)
        }
        
    }
    func parser(parser: NSXMLParser!, didEndElement elementName: String!,namespaceURI: String!, qualifiedName qName: String!)
    {
          if(elementName as NSString).isEqualToString("row")
          {
            
            if !subWayId.isEqual(nil)
            {
              //  returnData = ""
              //  returnData = (subWayId as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                elements.setObject(subWayId, forKey: "호선코드")
            }
            if !stationName.isEqual(nil)
            {
                returnData = ""
                returnData = (stationName as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                elements.setObject(returnData, forKey: "역이름")
                           }
            if !updnLine.isEqual(nil)
            {
                returnData = ""
                returnData = (updnLine as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                elements.setObject(returnData, forKey: "상하행선")
            }
            if !trainDestination.isEqual(nil)
            {
                returnData = ""
                returnData = (trainDestination as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                elements.setObject(returnData, forKey: "행선지")
            }
            if !trainKind.isEqual(nil)
            {
                returnData = ""
                returnData = (trainKind as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                elements.setObject(returnData, forKey: "급행")
            }
            if !arriveStatus.isEqual(nil)
            {
                returnData = ""
                returnData = (arriveStatus as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                elements.setObject(returnData, forKey: "도착정보")
            }
            if !arriveStatus2.isEqual(nil)
            {
             //   returnData = ""
             //   returnData = (arriveStatus2 as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                elements.setObject(arriveStatus2, forKey: "도착코드")
            }
            if !arriveTime.isEqual(nil)
            {
              //  returnData = ""
               // returnData = (arriveTime as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                elements.setObject(arriveTime, forKey: "도착예정시간")
            }
            
            
                posts.addObject(elements)
                RealTimestations.append(RealTimeInfo(
                    subWayId: (subWayId as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()),
                    updnLine: (updnLine as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()),
                    trainDestination: (trainDestination as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()),
                    trainKind: (trainKind as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()),
                    stationName: (stationName as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()),
                    arriveStatus: (arriveStatus as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()),
                    arriveTime: (arriveTime as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()),
                    arriveStatus2: (arriveStatus2 as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())))
            

        }
    }

    
    
}

//class ParsingInWeb_StationInfo: NSObject, NSXMLParserDelegate{
//    var parser = NSXMLParser()
//    
//    var posts = NSMutableArray()
//    
//    var elements = NSMutableDictionary()
//    var element = NSString()
//    var parsingData = NSMutableString()
//    var rootName: String = ""
//    var childName: String = ""
//    var returnData: String = ""
//    
//    func beginParsing(parsingMode mode: Int)
//    {
//        parsingMode = mode
//        if(mode == 0)
//        {
//            d_posts = NSMutableDictionary()
//            d_posts = [:]
//        }
//        else if(mode == 1)
//        {
//            a_posts = NSMutableArray()
//            a_posts = []
//        }
//        
//        parser = NSXMLParser(contentsOfURL: NSURL(fileURLWithPath: path!))!
//        parser.delegate = self
//        parser.parse()
//        
//    }
//    
//    func parser(parser:NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?,
//                attributes attributeDict: [String : String])
//    {
//        element = elementName
//        
//        if(elementName as NSString).isEqualToString("Station")
//        {
//            elements = NSMutableDictionary()
//            elements = [:]
//            stationCode = NSMutableString()
//            stationCode = ""
//            stationExCode = NSMutableString()
//            stationExCode = ""
//            stationName = NSMutableString()
//            stationName = ""
//            stationLineNum = NSMutableString()
//            stationLineNum = ""
//            lineImage = NSString()
//            lineImage = ""
//            
//            
//        }
//    }
//    
//    func parser(parser: NSXMLParser!, foundCharacters string: String!)
//    {
//        if element.isEqualToString("stnCode")
//        {
//            stationCode.appendString(string)
//        }
//        else if element.isEqualToString("stnName")
//        {
//            stationName.appendString(string)
//        }
//        else if element.isEqualToString("stnExCode")
//        {
//            stationExCode.appendString(string)
//        }
//        else if element.isEqualToString("stnLine")
//        {
//            let temp = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
//            var tempname: String = ""
//            switch temp {
//            case "I":
//                tempname = "인천지하철 1호선"
//                break
//                
//            case "K":
//                tempname = "경의중앙선"
//                break
//                
//            case "B":
//                tempname = "분당선"
//                break
//                
//            case "A":
//                tempname = "공항철도"
//                break
//                
//            case "U":
//                tempname = "의정부경전철"
//                break
//                
//            case "S":
//                tempname = "신분당선"
//                break
//                
//            case "SU":
//                tempname = "수인선"
//                break
//                
//            case "G":
//                tempname = "경춘선"
//                break
//            case "E":
//                tempname = "에버라인"
//                break
//            default:
//                tempname = temp
//                break
//            }
//            
//            stationLineNum.appendString(tempname)
//        }
//        
//    }
//    func parser(parser: NSXMLParser!, didEndElement elementName: String!,namespaceURI: String!, qualifiedName qName: String!)
//    {
//        //  if(elementName as NSString).isEqualToString("row")
//        if(elementName as NSString).isEqualToString("Station")
//        {
//            
//            if !stationName.isEqual(nil)
//            {
//                returnData = ""
//                returnData = (stationName as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
//                elements.setObject(returnData, forKey: "stnName")
//            }
//            if !stationExCode.isEqual(nil)
//            {
//                returnData = ""
//                returnData = (stationExCode as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
//                // stationExCode.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
//                //returnData = NSCharacterSet.whitespaceAndNewlineCharacterSet()
//                elements.setObject(returnData, forKey: "stnExCode")
//            }
//            if !stationLineNum.isEqual(nil)
//            {
//                returnData = ""
//                returnData = (stationLineNum as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
//                elements.setObject(returnData, forKey: "stnLine")
//                elements.setObject("\(returnData).png", forKey: "stnImage")
//            }
//            if !stationCode.isEqual(nil)
//            {
//                returnData = ""
//                returnData = (stationCode as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
//                elements.setObject(returnData, forKey: "stnCode")
//            }
//            
//            if(parsingMode == 0)
//            {
//                d_posts.setObject(elements, forKey: stationName)
//            }
//            else if(parsingMode == 1)
//            {
//                a_posts.addObject(elements)
//                let imagename = (stationLineNum as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
//                stations.append(StationInfo(name: (stationName as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()), externalCode: (stationExCode as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()),
//                    lineNumber: (stationLineNum as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()),
//                    imageName:("\(imagename).png")
//                    )
//                )
//            }
//            
//        }
//    }
//    
//    
//    
//}
class ParsingInWeb_Transfer: NSObject, NSXMLParserDelegate{
    var parser = NSXMLParser()
    
    var posts = NSMutableArray()
    
    var elements = NSMutableDictionary()
    var element = NSString()
    var parsingData = NSMutableString()
    var rootName: String = ""
    var childName: String = ""
    var returnData: String = ""
    
    
    var StartStation = NSMutableString()
    var DestStation = NSMutableString()
    var ShortTimeStatonList = NSMutableArray()
    var ShortTimeTransferInfo = NSMutableString()
    
   
    var ShortTransferStatonList = NSMutableArray()
    var ShortTransferTransferInfo = NSMutableString()
    
    var TransferData = [TransferInfo]()
    
    var temp1: String?
    
    func beginParsing(startStation: String, destStation: String)
    {
   
        posts = NSMutableArray()
        posts = []
        let original = String("http://swopenAPI.seoul.go.kr/api/subway/42764d466365657031303157445a4859/xml/shortestRoute/0/5/\(startStation)/\(destStation)")
        var encodedString = original.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())

        parser = NSXMLParser(contentsOfURL: NSURL(string: encodedString!)!)!
        parser.delegate = self
        parser.parse()
        
    }
    
    func parser(parser:NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?,
                attributes attributeDict: [String : String])
    {
        element = elementName
        
        if(elementName as NSString).isEqualToString("Station")
        {
            elements = NSMutableDictionary()
            elements = [:]
            StartStation = NSMutableString()
            StartStation = ""
            DestStation = NSMutableString()
            DestStation = ""
            ShortTimeStatonList = NSMutableArray()
            ShortTimeStatonList = []
            ShortTimeTransferInfo = NSMutableString()
            ShortTimeTransferInfo = ""
            
            ShortTransferStatonList = NSMutableArray()
            ShortTransferStatonList = []
            ShortTransferTransferInfo = NSMutableString()
            ShortTransferTransferInfo = ""
            temp1 = ""
            
        }
    }
    
    func parser(parser: NSXMLParser!, foundCharacters string: String!)
    {
        if element.isEqualToString("statnFnm")
        {
            if temp1 != string
            {
                temp1 = string
                StartStation.appendString(string)
            }
           
        }
        else if element.isEqualToString("statnTnm")
        {
            DestStation.appendString(string)
        }
        else if element.isEqualToString("shtStatnNm")
        {
            ShortTimeStatonList.addObject(string)
        }
        else if element.isEqualToString("shtTravelMsg")
        {
            let tempString = string
            tempString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            let strsplit = tempString.characters.split(",")
            print(strsplit)
            //string.stringByTrimmingCharactersInSet(set: NSCharacterSet)
            //string.componentsSeparatedByString(<#T##separator: String##String#>)
            ShortTimeTransferInfo.appendString(string)
           //  ShortTimeTransferInfo.appendString(string)
        }
        else if element.isEqualToString("minStatnNm")
        {
            ShortTransferStatonList.addObject(string)
        }
        else if element.isEqualToString("minTravelMsg")
        {
            ShortTransferTransferInfo.appendString(string)
        }
    }
    func parser(parser: NSXMLParser!, didEndElement elementName: String!,namespaceURI: String!, qualifiedName qName: String!)
    {
          if(elementName as NSString).isEqualToString("row")
          {
            
            if !StartStation.isEqual(nil)
            {
                elements.setObject(StartStation, forKey: "출발역")
            }
            if !DestStation.isEqual(nil)
            {
                elements.setObject(DestStation, forKey: "도착역")
            }
            if !ShortTimeStatonList.isEqual(nil)
            {
                elements.setObject(ShortTimeStatonList, forKey: "최단경로경유역")
            }
            if !ShortTimeTransferInfo.isEqual(nil)
            {
                elements.setObject(ShortTimeTransferInfo, forKey: "최단경로정보")
            }
            if !ShortTransferStatonList.isEqual(nil)
            {
                elements.setObject(ShortTransferStatonList, forKey: "최소환승경유역")
            }
            if !ShortTransferTransferInfo.isEqual(nil)
            {
                 elements.setObject(ShortTransferTransferInfo, forKey: "최소환승정보")
            }
                posts.addObject(elements)
            TransferData.append(TransferInfo(
                StartStation: (StartStation as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()),
                DestStation: (DestStation as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()),
                ShortTimeStatonList: ShortTimeStatonList as NSArray as! Array,
                ShortTimeTransferInfo: (ShortTimeTransferInfo as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()),
                ShortTransferStatonList: ShortTransferStatonList as NSArray as! Array,
                ShortTransferTransferInfo: (ShortTransferTransferInfo as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())))
                //stations.append(StationInfo(name: (stationName as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()), externalCode: (stationExCode as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()),
                  //  lineNumber: (stationLineNum as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()),
                 //   imageName:("\(imagename).png")
                 //   )
            //    )
          //  }
            
       }
    }
    
    
    
}



class ParsingInFile: NSObject, NSXMLParserDelegate{
    var parser = NSXMLParser()
    
    var d_posts = NSMutableDictionary()
    var a_posts = NSMutableArray()
    var parsingData = NSMutableString()
    var rootName: String = ""
    var childName: String = ""
    var returnData: String = ""
    
    var elements = NSMutableDictionary()
    var element = NSString()
    var stationCode = NSMutableString()
    var stationExCode = NSMutableString()
    var stationName = NSMutableString()
    var stationLineNum = NSMutableString()
    var parsingMode: Int = 0
    var lineImage = NSString()
    var stations = [StationInfo]()
    let path = NSBundle.mainBundle().pathForResource("stationData", ofType: "xml")
    
    
    func beginParsing(parsingMode mode: Int)
    {
        parsingMode = mode
        if(mode == 0)
        {
            d_posts = NSMutableDictionary()
            d_posts = [:]
        }
        else if(mode == 1)
        {
            a_posts = NSMutableArray()
            a_posts = []
        }
 
        parser = NSXMLParser(contentsOfURL: NSURL(fileURLWithPath: path!))!
        parser.delegate = self
        parser.parse()
        
    }
    
    func parser(parser:NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?,
                attributes attributeDict: [String : String])
    {
        element = elementName
        
        if(elementName as NSString).isEqualToString("Station")
        {
            elements = NSMutableDictionary()
            elements = [:]
            stationCode = NSMutableString()
            stationCode = ""
            stationExCode = NSMutableString()
            stationExCode = ""
            stationName = NSMutableString()
            stationName = ""
            stationLineNum = NSMutableString()
            stationLineNum = ""
            lineImage = NSString()
            lineImage = ""
            
            
        }
    }
    
    func parser(parser: NSXMLParser!, foundCharacters string: String!)
    {
        if element.isEqualToString("stnCode")
        {
            stationCode.appendString(string)
        }
        else if element.isEqualToString("stnName")
        {
            stationName.appendString(string)
        }
        else if element.isEqualToString("stnExCode")
        {
            stationExCode.appendString(string)
        }
        else if element.isEqualToString("stnLine")
        {
            let temp = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            var tempname: String = ""
            switch temp {
                case "I":
                tempname = "인천지하철 1호선"
                break
                
                case "K":
                tempname = "경의중앙선"
                break
                
                case "B":
                tempname = "분당선"
                break
                
                case "A":
                tempname = "공항철도"
                break
                
                case "U":
                tempname = "의정부경전철"
                break
                
                case "S":
                tempname = "신분당선"
                break
                
                case "SU":
                tempname = "수인선"
                break
                
                case "G":
                tempname = "경춘선"
                break
                case "E":
                tempname = "에버라인"
                break
            default:
                tempname = temp
                break
            }
            
            stationLineNum.appendString(tempname)
        }

    }
    func parser(parser: NSXMLParser!, didEndElement elementName: String!,namespaceURI: String!, qualifiedName qName: String!)
    {
        //  if(elementName as NSString).isEqualToString("row")
        if(elementName as NSString).isEqualToString("Station")
        {
            
            if !stationName.isEqual(nil)
            {
                returnData = ""
                returnData = (stationName as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                elements.setObject(returnData, forKey: "stnName")
            }
            if !stationExCode.isEqual(nil)
            {
                returnData = ""
                returnData = (stationExCode as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
               // stationExCode.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                //returnData = NSCharacterSet.whitespaceAndNewlineCharacterSet()
                elements.setObject(returnData, forKey: "stnExCode")
            }
            if !stationLineNum.isEqual(nil)
            {
                returnData = ""
                returnData = (stationLineNum as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                elements.setObject(returnData, forKey: "stnLine")
                elements.setObject("\(returnData).png", forKey: "stnImage")
            }
            if !stationCode.isEqual(nil)
            {
                returnData = ""
                returnData = (stationCode as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                elements.setObject(returnData, forKey: "stnCode")
            }
            
            if(parsingMode == 0)
            {
                d_posts.setObject(elements, forKey: stationName)
            }
            else if(parsingMode == 1)
            {
                a_posts.addObject(elements)
                let imagename = (stationLineNum as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                stations.append(StationInfo(name: (stationName as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()), externalCode: (stationExCode as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()),
                    lineNumber: (stationLineNum as NSString as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()),
                    imageName:("\(imagename).png")
                    )
                )
            }
            
            // print(posts.count)
            // index += 1
        }
    }

    
}