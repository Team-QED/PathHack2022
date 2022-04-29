//
//  Badge.swift
//  PathHack
//
//  Created by Lee on 2022/04/29.
//

import Foundation

struct Badge: Hashable {
    let inType: InType
    let level: Level
    var currRecord: Int
    
    var record: Int {
        switch self.currRecord > 100 {
        case true:
            return currRecord - level.value
        case false:
            return currRecord
        }
    }
    
    var imageName: String {
        inType.rawValue + "_" + level.rawValue
    }
    
    var percent: Double {
        Double(record) / Double(level.value)
    }
    
    var percentStr: String {
        String(record) + " / " + String(level.value)
    }
     
    enum Level: String {
        case bronze
        case silver
        case gold
        
        var value: Int {
            switch self {
            case .bronze:
                return 100
            case .silver:
                return 300
            case .gold:
                return 500
            }
        }
    }
    
    enum InType: String {
        case book
        case running
        case movie
        case coding
        case cook
        case bicycle
        
        var name: String {
            switch self {
            case .book:
                return "독서"
            case .running:
                return "러닝"
            case .movie:
                return "영화"
            case .coding:
                return "코딩"
            case .cook:
                return "요리"
            case .bicycle:
                return "자전거"
            }
        }
    }
}


let badgeData: [Badge] = [
    Badge(inType: .book, level: .gold, currRecord: 300),
    Badge(inType: .running, level: .silver, currRecord: 100),
    Badge(inType: .movie, level: .bronze, currRecord: 10),
    Badge(inType: .coding, level: .bronze, currRecord: 5),
    Badge(inType: .cook, level: .bronze, currRecord: 5),
    Badge(inType: .bicycle, level: .silver, currRecord: 100),
]
