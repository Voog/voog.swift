//
//  Language.swift
//  Voog
//
//  Created by Priit Haamer on 12.07.15.
//  Copyright © 2015 Voog. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct Language {
    
    var id: Int
    
    var code: String
    
    var title: String
    
    var siteTitle: String
    
    var siteHeader: String
    
    var defaultLanguage: Bool
    
    var position: Int
    
    
}

internal extension Language {
    init?(json: JSON) {
        if let identifier = json["id"].int {
            self.init(
                id: identifier,
                code: json["code"].stringValue,
                title: json["title"].stringValue,
                siteTitle: json["site_title"].stringValue,
                siteHeader: json["site_header"].stringValue,
                defaultLanguage: json["default_language"].boolValue,
                position: json["position"].intValue
            )
        } else {
            return nil
        }
        
    }
}