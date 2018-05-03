//
//  CrewManager.swift
//  starfleet
//
//  Created by Arif De Sousa on 03/05/2018.
//  Copyright © 2018 arifads. All rights reserved.
//

import Foundation


class CrewManager {
    
    static func randomCrew() -> [Crew] {
        return (1...430).map {
            Crew(
                id: $0,
                area: CrewArea(rawValue: randomInt(min: 0, max: 2))!,
                race: CrewRace(rawValue: randomInt(min: 0, max: 2))!
            )
        }
    }
}

// https://stackoverflow.com/a/25023371
private func randomInt(min: Int, max:Int) -> Int {
    return min + Int(arc4random_uniform(UInt32(max - min + 1)))
}
