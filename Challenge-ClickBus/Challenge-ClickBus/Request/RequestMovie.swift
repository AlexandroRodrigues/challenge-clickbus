//
//  RequestMovie.swift
//  Challenge-ClickBus
//
//  Created by Madeinweb on 23/01/22.
//

import Alamofire

class RequestMovie {
   
    var baseURL: String {
        return Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String ?? ""
    }
    
    var apiKey: String {
        return Bundle.main.object(forInfoDictionaryKey: "Api_Key") as? String ?? ""
    }
    
    func requestMovie(completion: @escaping (DiscoverModel?, Bool) -> Void ) {
        let urlString: String = baseURL+"/discover/movie"
        let params = ["api_key": apiKey]
        
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
}
