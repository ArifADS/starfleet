//
//  CrewCell.swift
//  starfleet
//
//  Created by Arif De Sousa on 03/05/2018.
//  Copyright © 2018 arifads. All rights reserved.
//

import UIKit

class CrewCell: UITableViewCell {
    
    @IBOutlet weak var areaView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var raceLabel: UILabel!
    @IBOutlet weak var multiplierLabel: UILabel!
    
    var model: Crew! {
        didSet { setModel() }
    }

    private func setModel() {
        let crew = self.model!
        nameLabel.text = crew.name
        areaView.backgroundColor = crew.area.color
        raceLabel.text = crew.race.name
        multiplierLabel.text = "x\(crew.multiplier)"        
    }
}
