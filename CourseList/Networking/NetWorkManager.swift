//
//  NetWorkManager.swift
//  CourseList
//
//  Created by mai nguyen on 7/21/23.
//

import Foundation


class NetWorkManager {
    static let shared  = NetWorkManager()
    var courses:[Course] = []
    
    private init() {
    }
    
    func getData(completion: @escaping ([Course]) -> Void) {
        let url = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let urlString = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: urlString) { data, response, error in
            guard  let data = data ,let  response = response as? HTTPURLResponse  else {
                return
                
            }
            
            let jsonDecoder = JSONDecoder()
            do {
                let course = try jsonDecoder.decode([Course].self, from: data)
                completion(course)
            }
            catch {
                print(String(describing: error))
            }
        }
        .resume()
    }
    
    
}
