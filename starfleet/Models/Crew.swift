//
//  Crew.swift
//  starfleet
//
//  Created by Arif De Sousa on 03/05/2018.
//  Copyright © 2018 arifads. All rights reserved.
//

import Foundation
import UIKit.UIColor

enum CrewArea: Int {
    case command = 0, science, engineering
    
    var color: UIColor {
        switch self {
        case .command:      return .yellow
        case .engineering:  return .red
        case .science:      return .blue
        }
    }
}

enum CrewRace: Int {
    case human, betazoid, vulcan
    
    var name: String {
        switch self {
        case .betazoid: return "Betazoid"
        case .human: return "Human"
        case .vulcan: return "Vulcan"
        }
    }
}

struct Crew {
    let id: Int
    let area: CrewArea
    let race: CrewRace
    
    var name: String {
        return "Crew #\(id)"
    }
    
    var multiplier: Int {
        
        switch (race, area) {
        case (.human, .command): return 3
        case (.human, .engineering): return 2
        case (.human, .science): return 1
            
        case (.betazoid, .command): return 2
        case (.betazoid, .engineering): return 1
        case (.betazoid, .science): return 3
            
        case (.vulcan, .command): return 1
        case (.vulcan, .engineering): return 3
        case (.vulcan, .science): return 2
            
        }
    }
}
