//
//  GitCommitButton.swift
//  GitCommits
//
//  Created by Adam Rikardsen-Smith on 24/11/2018.
//  Copyright © 2018 Adam Rikardsen-Smith. All rights reserved.
//

import UIKit

@IBDesignable class GitCommitButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 6
    @IBInspectable var borderColor: UIColor = UIColor.black
    @IBInspectable var borderWidth: CGFloat = 2
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
    }
}
