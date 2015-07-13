//
//  Layout.swift
//  Voog
//
//  Created by Priit Haamer on 12.07.15.
//  Copyright © 2015 Voog. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct Layout {
    
    var id: Int
    
    var title: String
    
    var body: String
    
    var component: Bool
    
    var layoutName: String
    
    var contentType: String
    
    var parentId: Int

}

internal extension Layout {
    init?(json: JSON) {
        if let identifier = json["id"].int {
            self.init(
                id: identifier,
                title: json["title"].stringValue,
                body: json["body"].stringValue,
                component: json["component"].boolValue,
                layoutName: json["layout_name"].stringValue,
                contentType: json["content_type"].stringValue,
                parentId: json["parent_id"].intValue
            )
        } else {
            return nil
        }
        
    }
}