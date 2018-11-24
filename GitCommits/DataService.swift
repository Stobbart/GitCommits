//
//  DataService.swift
//  GitCommits
//
//  Created by Adam Rikardsen-Smith on 24/11/2018.
//  Copyright © 2018 Adam Rikardsen-Smith. All rights reserved.
//

import Foundation
import UIKit

class DataService: NSObject{
    
    static var dataService: DataService = DataService()
    let url = URL(string: "https://api.github.com/repos/apple/swift/commits")
    var commits: [Commit] = []
    
    func downloadCommits(completion: @escaping (
        ) -> Void) {
        
        URLSession.shared.dataTask(with: url!, completionHandler: {(data, response, error) -> Void in
            do{
                self.commits.removeAll()
                if let jsonObj = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSArray {
                    _ = jsonObj.map({
                        if let jsonData = try? JSONSerialization.data(withJSONObject: $0, options: []) {
                            self.commits.append(try! JSONDecoder().decode(Commit.self, from: jsonData))
                        }
                    })
                    
                    completion()
                }
            } catch let anError{
                print(anError.localizedDescription)
            }
            
        }).resume()
        
    }
}
