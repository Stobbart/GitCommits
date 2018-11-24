//
//  CommitInfoViewController.swift
//  GitCommits
//
//  Created by Adam Rikardsen-Smith on 24/11/2018.
//  Copyright © 2018 Adam Rikardsen-Smith. All rights reserved.
//

import UIKit

class CommitInfoViewController: UIViewController {

    
    @IBOutlet weak var commitTitleLabel: UILabel!
    @IBOutlet weak var commitDateLabel: UILabel!
    @IBOutlet weak var commitAuthorLabel: UILabel!
    @IBOutlet weak var authorAccountImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let selectedCommit = DataService.dataService.selectedCommit
        commitTitleLabel.text = selectedCommit.title
        commitDateLabel.text = selectedCommit.date
        commitAuthorLabel.text = selectedCommit.authorName
        
        let url = URL(string: selectedCommit.imageURL)
        if let data = NSData(contentsOf: url ?? URL(fileURLWithPath: "")) {
            authorAccountImage.image = UIImage(data: data as Data)
        }
        
        
    }


}
