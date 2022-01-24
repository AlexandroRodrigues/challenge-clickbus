//
//  ListController.swift
//  Challenge-ClickBus
//
//  Created by Madeinweb on 23/01/22.
//

import Foundation

class ListController: NSObject {
    
    var request = RequestMovie()
    var controller: DiscoverModel?
    
    func getList(completion: @escaping (Bool) -> Void) {
        request.requestMovie { (model, sucess) in
            if sucess {
                self.controller = model
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return controller?.results?.count ?? 0
    }
    
    func getItemByIndex(indexPath: IndexPath) -> DiscoverMovie {
        return self.controller?.results?[indexPath.row] ?? DiscoverMovie(adult: false, backdropPath: "", genreIDS: [], id: 0, originalLanguage: "", originalTitle: "", overview: "", popularity: 0, posterPath: "", releaseDate: "", title: "", video: false, voteAverage: 0, voteCount: 0, favorite: false)
    }

    
    func saveFavorite(indexPath: IndexPath) {
        
    }
    
}

