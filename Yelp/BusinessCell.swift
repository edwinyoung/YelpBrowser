//
//  BusinessCell.swift
//  Yelp
//
//  Created by Edwin Young on 2/17/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {
	
	
	@IBOutlet weak var businessImage: UIImageView!
	@IBOutlet weak var businessNameLabel: UILabel!
	@IBOutlet weak var distanceLabel: UILabel!
	@IBOutlet weak var ratingImage: UIImageView!
	@IBOutlet weak var reviewCountLabel: UILabel!
	@IBOutlet weak var addressLabel: UILabel!
	@IBOutlet weak var categoryLabel: UILabel!
	
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
}
