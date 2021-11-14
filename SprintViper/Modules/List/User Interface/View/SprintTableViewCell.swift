//
//  SprintTableViewCell.swift
//  SprintViper
//
//  Created by user204006 on 11/14/21.
//

import UIKit

class SprintTableViewCell: UITableViewCell {

    @IBOutlet weak var sprintNameLabel: UILabel!
    
    var display: SprintListItemViewModel?
    
    func setUp() {
        guard let display = self.display else { return }
        
        sprintNameLabel.text = display.nome

    }
    
}
