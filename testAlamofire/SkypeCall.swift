//
//  Call.swift
//  ParseJSON2
//
//  Created by Cuu Long Hoang on 7/30/16.
//  Copyright © 2016 Long Hoang. All rights reserved.
//

import Foundation

struct SkypeCall {
    var id:Int
    var members:[Member] = [Member]()
    var name:String
    var description:String = ""
    
    init?(jsonData: [String : AnyObject]) {
        guard   let id = jsonData["id"] as? Int,
                let name = jsonData["name"] as? String
            else { return nil }
        
        self.id = id
        self.name = name
        guard let description = jsonData["description"] as? String else {return}
        if description != "" {
            self.description = description
        }
        guard let members = jsonData["members"] as? [[String : AnyObject]] else {return}
        if members.count > 0 {
            for memberData in members {
                if let member = Member(jsonData: memberData) {
                    self.members.append(member)
                }
            }
        }
        
    }
}
