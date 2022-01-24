//
//  ListCollectionViewCell.swift
//  Challenge-ClickBus
//
//  Created by Madeinweb on 23/01/22.
//

import UIKit
import SDWebImage

class ListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var twoLb: UILabel!
    @IBOutlet weak var treeLb: UILabel!
    @IBOutlet weak var forLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    let request = RequestMovie()
    
    var handledFavoriteButton: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(list: DiscoverMovie){
        nameLb.text = list.originalTitle
        twoLb.text = list.originalLanguage
        treeLb.text = list.overview
        forLabel.text = list.releaseDate
        self.configureImage(posterPath: list.posterPath)
    
    }
    
    func configureImage(posterPath: String?) {
        if let imageURL: URL = URL(string:"\(Constant.shared.base_Image_URL)\(posterPath ?? "")") {
            movieImageView.sd_setImage(with: imageURL, completed: nil)
        }
    }
    
    func configureFavorite(favorite: Bool) {
        if favorite {
            
        }
    }
    
    @IBAction func favoriteButtonAction(sender: UIButton) {
        handledFavoriteButton?()
    }
}
