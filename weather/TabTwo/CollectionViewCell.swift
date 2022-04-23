//
//  CollectionViewCell.swift
//  weather
//
//  Created by disco on 21.04.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var descriptionImage: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var valueLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

	func setupCell(with item: Description) {
		descriptionImage.image = UIImage(named: item.iconName)
		titleLabel.text = item.title
		valueLabel.text = item.value
	}
}
