//
//  ParseHandle.swift
//  tarin
//
//  Created by kpugame on 2016. 6. 6..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import Foundation

class ParsingInWeb: NSObject, NSXMLParserDelegate{
    var parser = NSXMLParser()
    
    var posts = NSMutableArray()
    
    var elements = NSMutableDictionary()
    var element = NSString()
    var parsingData = NSMutableString()
    var rootName: String = ""
    var childName: String = ""
    var returnData: String = ""
    
    
    
    
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