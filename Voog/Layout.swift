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
    
    public var id: Int
    
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
                `id`: identifier,
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

public extension VoogClient {
    
    public func layouts(callback: (Array<Layout>) -> Void) {
        var layouts = [Layout]()
        
        self.getJSON("http://\(self.host)/admin/api/layouts") {
            for (index: _, subJson: json) in $0 {
                if let layout = Layout(json: json) {
                    layouts.append(layout)
                }
            }
            
            callback(layouts)
        }
    }
    
    public func layout(id: Int, callback: (Layout) -> Void) {
        self.getJSON("http://\(self.host)/admin/api/layouts/\(id)") {
            if let layout = Layout(json: $0) {
                callback(layout)
            }
        }
    }
    
}