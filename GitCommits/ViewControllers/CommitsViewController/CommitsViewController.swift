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
        DataService.dataService.downloadCommits(completion: { (error) in
            switch error{
                case .NONE:
                    DispatchQueue.main.async {
                        self.commitsTableView.reloadData()
                    }
                case .NO_CONNECTION:
                    self.errorAlert(title: "No Data Found", message: error.rawValue)
                    break
            }
            DispatchQueue.main.async {
                self.refreshButton.isEnabled = true
            }
            
        }
    )}
    
    func errorAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func refreshCommits(){
        loadCommits()
        refreshButton.isEnabled = false
    }
    
}

    // MARK: Table View Delegates

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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DataService.dataService.selectedCommitIndex = indexPath.row
    
    }
    
}
