//
//  Item.swift
//  Fetch_take_home
//
//  Created by Jerry Walton on 3/14/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
