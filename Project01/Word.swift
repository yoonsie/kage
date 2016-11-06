//
//  Noun.swift
//  Project01
//
//  Created by Yoonsie Kim on 11/5/16.
//  Copyright © 2016 Yoonsie Kim. All rights reserved.
//

import UIKit

class Noun: NSObject {
    
//    Properties
    var japaneseWord: String //this will be hardcoded b/c the point of the app is to learn this language
    var nativeWord: String //this will be localized and will be translated in the user's native language
    
    
//    Designated onstructor
    init ( _ japaneseWord: String, _ nativeWord: String) {
        self.japaneseWord = japaneseWord
        self.nativeWord = nativeWord
    }
    

}//end class
