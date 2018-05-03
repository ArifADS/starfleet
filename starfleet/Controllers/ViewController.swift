//
//  ViewController.swift
//  starfleet
//
//  Created by Arif De Sousa on 03/05/2018.
//  Copyright © 2018 arifads. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    var dataModel = [Crew]() {
        didSet { self.tableView.reloadData() }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        dataModel = sortByName(crews: CrewManager.randomCrew())
    }
    
    @IBAction func segDidChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            dataModel = sortByName(crews: dataModel)
        } else {
            dataModel = sortByPosition(crews: dataModel)
        }
    }
    
    private func sortByPosition(crews:[Crew]) -> [Crew] {
        return crews
            .sorted(by: { (c1, c2) -> Bool in
                if (c1.area == c2.area) && (c1.multiplier == c2.multiplier)  {
                    return c1.id < c2.id
                } else if (c1.area == c2.area) {
                    return c1.multiplier > c2.multiplier
                } else {
                    return c1.area.rawValue < c2.area.rawValue
                }
            })
    }
    
    private func sortByName(crews: [Crew]) -> [Crew] {
        return crews.sorted(by: { (c1, c2) -> Bool in
            return c1.id < c2.id
        })
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CrewCell", for: indexPath) as! CrewCell
        cell.model = dataModel[indexPath.row]
        return cell
    }
    
}
