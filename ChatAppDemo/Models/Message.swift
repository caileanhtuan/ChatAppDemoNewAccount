//
//  Message.swift
//  ChatAppDemo
//
//  Created by Tuan Cai on 1/30/24.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
