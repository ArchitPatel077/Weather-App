//
//  WebService.swift
//  WebService
//
//  Created by Archit Patel on 2021-09-11.
//

import UIKit

struct Resource<T> {
    let url : URL
    let parse : (Data) -> T?
}

final class WebService {
    
    func load<T>(resource: Resource<T>, completion : @escaping (T?) -> ()) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error  in
            
           // print(data)
            
            if let data = data {
                
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
               
            } else {
                completion(nil )
            }
            
        }.resume()
    }
}
