//
//  Member.swift
//  ParseJSON2
//
//  Created by Cuu Long Hoang on 7/30/16.
//  Copyright © 2016 Long Hoang. All rights reserved.
//

import Foundation

struct Member {
    var id:Int
    var name:String
    
    init?(jsonData: [String : AnyObject] ) {
        guard   let id      =    jsonData["id"] as? Int,
            let name    =    jsonData["name"] as? String
            else { return nil }
        
        self.id = id
        self.name = name
    }
}
