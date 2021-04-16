//
//  CoinTableViewCell.swift
//  ExampleAPI
//
//  Created by Lucas Werner Kuipers on 15/04/2021.
//

import UIKit

class CoinTableViewCell: UITableViewCell {

	@IBOutlet weak var coinIconImageView: UIImageView!
	@IBOutlet weak var coinNameLabel: UILabel!
	@IBOutlet weak var coinAssetIDLabel: UILabel!
	@IBOutlet weak var coinValueLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
