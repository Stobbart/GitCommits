//
//  GitCommitImageView.swift
//  GitCommits
//
//  Created by Adam Rikardsen-Smith on 24/11/2018.
//  Copyright © 2018 Adam Rikardsen-Smith. All rights reserved.
//

import UIKit

@IBDesignable class GitCommitImageView: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 6
    
    override func draw(_ rect: CGRect) {

    }
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius

    }

}
