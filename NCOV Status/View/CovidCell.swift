//
//  CovidCell.swift
//  NCOV Status
//
//  Created by LeHung on 4/3/20.
//  Copyright © 2020 LeHung. All rights reserved.
//

import UIKit

class CovidCell: UITableViewCell {
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var casesLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: CovidData) {
        countryLabel.text = data.country
        casesLabel.text = data.cases
        deathsLabel.text = data.deaths
        recoveredLabel.text = data.recovered
    }
    
}
