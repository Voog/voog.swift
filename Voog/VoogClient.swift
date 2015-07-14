//
//  Voog.swift
//  Voog
//
//  Created by Priit Haamer on 12.07.15.
//  Copyright © 2015 Voog. All rights reserved.
//

import Foundation
import SwiftyJSON

public class VoogClient {
    
    var host = ""
    
    var apiKey = ""
    
    public init(host: String, apiKey: String) {
        self.host = host
        self.apiKey = apiKey
    }
    
    func getJSON(url: String, callback: (JSON) -> Void) {
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Voog Swift Client Library 1.0", forHTTPHeaderField: "User-Agent")
        request.addValue(self.apiKey, forHTTPHeaderField: "X-API-TOKEN")
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            if (error != nil) {
                // callback("", error.localizedDescription)
            } else {
                callback(JSON(data: data!))
            }
        }
        
        task!.resume()
    }
    
    public func languages(callback: (Array<Language>) -> Void) {
        var languages = [Language]()
        
        self.getJSON("http://\(self.host)/admin/api/languages") {
            for (index: _, subJson: json) in $0 {
                if let language = Language(json: json) {
                    languages.append(language)
                }
                
            }
            
            callback(languages)
        }
        
        
    }
    
}
