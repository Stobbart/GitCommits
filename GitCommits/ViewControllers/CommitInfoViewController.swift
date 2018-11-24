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
        commitTitleLabel.text = DataService.dataService.selectedCommit.title
        commitDateLabel.text = DataService.dataService.selectedCommit.date
        commitAuthorLabel.text = DataService.dataService.selectedCommit.authorName
    }


}
