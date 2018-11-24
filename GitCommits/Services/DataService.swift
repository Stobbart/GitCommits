//
//  DataService.swift
//  GitCommits
//
//  Created by Adam Rikardsen-Smith on 24/11/2018.
//  Copyright © 2018 Adam Rikardsen-Smith. All rights reserved.
//

import Foundation
import UIKit

enum ErrorType: String {
    case NO_CONNECTION = "No data returned, you may not be connected to a network", NONE = "No Error"
}

class DataService: NSObject{
    
    static var dataService: DataService = DataService()
    let url = URL(string: "https://api.github.com/repos/apple/swift/commits")
    var commits: [Commit] = []
    var selectedCommitIndex: Int = 0
    var selectedCommit: Commit{
        return commits[selectedCommitIndex]
    }
    
    func downloadCommits(completion: @escaping (_ error: ErrorType
        ) -> Void) {
        
        URLSession.shared.dataTask(with: url!, completionHandler: {(data, response, error) -> Void in
            do{
                if data == nil{
                    completion(ErrorType.NO_CONNECTION)
                    return
                }
                
                self.commits.removeAll()
                if let jsonObj = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSArray {
                    _ = jsonObj.map({
                        if let jsonData = try? JSONSerialization.data(withJSONObject: $0, options: []) {
                            self.commits.append(try! JSONDecoder().decode(Commit.self, from: jsonData))
                        }
                    })
                    
                    completion(ErrorType.NONE)
                }
            } catch let anError{
                print(anError.localizedDescription)
            }
            
        }).resume()
        
    }
    
}
