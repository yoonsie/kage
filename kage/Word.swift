//
//  Noun.swift
//  Project01
//
//  Created by Yoonsie Kim on 11/5/16.
//  Copyright © 2016 Yoonsie Kim. All rights reserved.
//

import UIKit

class Word: NSObject {
    
    //    Properties
    var japanese: String //this will be hardcoded b/c the point of the app is to learn this language
    var native: String //this will be localized and will be translated in the user's native language
    var imageFile: String
    
    
    //    Designated onstructor
    init ( _ japanese: String, _ native: String, _ imageFile: String) {
        self.japanese = japanese
        self.native = native
        self.imageFile = imageFile
    }
    
    
}//end class
