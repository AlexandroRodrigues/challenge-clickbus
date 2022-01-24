//
//  DetailViewController.swift
//  Challenge-ClickBus
//
//  Created by Madeinweb on 23/01/22.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var originalLanguage: UILabel!
    @IBOutlet weak var overview: UITextView!
    
    var discoverMovie: DiscoverMovie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
    }
    
    
    func configureView() {
        if let imageURL: URL = URL(string:"\(Constant.shared.base_Image_URL)\(discoverMovie?.posterPath ?? "")") {
            movieImageView.sd_setImage(with: imageURL, completed: nil)
        }
        self.titleMovie.text = discoverMovie?.originalTitle
        self.releaseDate.text = discoverMovie?.releaseDate
        self.originalLanguage.text = discoverMovie?.originalLanguage
        self.overview.text = discoverMovie?.overview
    }
}
