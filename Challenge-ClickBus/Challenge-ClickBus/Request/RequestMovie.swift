//
//  RequestMovie.swift
//  Challenge-ClickBus
//
//  Created by Madeinweb on 23/01/22.
//

import Alamofire

class RequestMovie {
    
    let baseURL = "https://api.themoviedb.org/3"
    let params = ["api_key": "0eca0d62470fa7cc424d5380b1d8f05f"]

    func alamofireMovie(completion: @escaping (DiscoverModel?, Bool) -> Void ) {
                
        let urlString: String = baseURL+"/discover/movie"
        
        if let url: URL = URL(string: urlString){
            AF.request(url, method: .get, parameters: params).responseJSON { (response) in
                if response.response?.statusCode == 200 {
                    
                    do {
                        if let data = response.data {
                            let object = try
                                JSONDecoder().decode(DiscoverModel.self, from: data)
                            print(object)
                            completion(object, true)
                        }
                    }
                    catch {
                        completion(nil, false)
                    }
                }
            }
        }
    }
    
    func getImage(pathImage: String, completion: (Bool, UIImage) -> Void) {
        
        let urlString: String = baseURL+pathImage
        
        if let url: URL = URL(string: urlString){
            AF.request(url, method: .get, parameters: params).responseJSON { (response) in
                if response.response?.statusCode == 200 {
                    
                    do {
                        if let data = response.data {
                            let object = try
                                JSONDecoder().decode(DiscoverModel.self, from: data)
                            print(object)
//                            completion(object, true)
                        }
                    }
                    catch {
                        print(error)
//                        completion(nil, false)
                    }
                }
            }
        }
    }
}
