//
//  TableViewCell.swift
//  me
//
//  Created by Ganiya Nursalieva on 13.02.2025.
//

import UIKit


class TableViewCell: UITableViewCell {
    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with hobbie: Hobbie) {
        coverImage.image = hobbie.coverIM
        titleLabel.text = hobbie.title
        descriptionLabel.text = hobbie.description
    }
}
