//
//  CommitsViewController.swift
//  GitCommits
//
//  Created by Adam Rikardsen-Smith on 24/11/2018.
//  Copyright © 2018 Adam Rikardsen-Smith. All rights reserved.
//

import UIKit

class CommitsViewController: UIViewController {
    
    @IBOutlet weak var commitsTableView: UITableView!
    @IBOutlet weak var refreshButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCommits()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadCommits()
    }
    
    func loadCommits(){
        DataService.dataService.downloadCommits(completion: {
            DispatchQueue.main.async {
                self.refreshButton.isEnabled = true
                self.commitsTableView.reloadData()
            }
        }
    )}
    
    @IBAction func refreshCommits(){
        loadCommits()
        refreshButton.isEnabled = false
    }
    
}

extension CommitsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.dataService.commits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let commitCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.CommitCell.rawValue, for: indexPath) as? CommitCell{
            commitCell.commitTitleLabel.text = DataService.dataService.commits[indexPath.row].title
            commitCell.commitNumberLabel.text = String(indexPath.row + 1)
            return commitCell
        }
        return UITableViewCell(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    
}
