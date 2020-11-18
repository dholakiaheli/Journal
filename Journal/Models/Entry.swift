//
//  Entry.swift
//  Journal
//
//  Created by Heli Bavishi on 11/4/20.
//

import Foundation

class Entry: Codable{
    
    var timestamp: Date
    var title: String
    var bodyText: String
    
    init(timestamp: Date = Date(), title: String, bodyText: String) {
        self.timestamp = timestamp
        self.title = title
        self.bodyText = bodyText
    }
}
extension Entry: Equatable {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
       return lhs.title == rhs.title &&
        lhs.bodyText == rhs.bodyText &&
        lhs.timestamp == rhs.timestamp
    }    
}
