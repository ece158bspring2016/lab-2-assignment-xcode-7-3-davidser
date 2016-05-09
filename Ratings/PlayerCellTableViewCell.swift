//
//  PlayerCellTableViewCell.swift
//  Ratings
//
//  Created by David Serrano on 4/22/16.
//  Copyright © 2016 David Serrano. All rights reserved.
//

import UIKit

class PlayerCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    
    var player: Player! {
        didSet {
            gameLabel.text = player.team
            nameLabel.text = player.name
            ratingImageView.image = imageForRating(player.rating)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func imageForRating(rating:Int) -> UIImage? {
        let imageName = "\(rating)Stars"
        return UIImage(named: imageName)
    }


}
