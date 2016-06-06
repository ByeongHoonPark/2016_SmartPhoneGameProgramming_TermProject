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
    
    var posts = NSMutableArray()
    
    var elements = NSMutableDictionary()
    var element = NSString()
    var parsingData = NSMutableString()
    var rootName: String = ""
    var childName: String = ""
    var returnData: String = ""
    
    
    
    
}