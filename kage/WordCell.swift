//
//  WordCell.swift
//  Project01
//
//  Created by Yoonsie Kim on 11/23/16.
//  Copyright © 2016 Yoonsie Kim. All rights reserved.
//

import UIKit

class WordCell: UITableViewCell {
    
    //outlet for image
    @IBOutlet var picture: UIImageView!
    
    
    //outlet for hardcoded Japanese
    @IBOutlet var japaneseLabel: UILabel!
    
    //outlet for native language (localized)
    @IBOutlet var nativeLabel: UILabel!
    
    
    
    func updateLabels() {
        let bodyFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        japaneseLabel.font = bodyFont
        nativeLabel.font = bodyFont
        
    }
    
    
}
