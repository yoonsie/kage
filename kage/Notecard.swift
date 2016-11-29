//
//  Notecard.swift
//  kage
//
//  Created by Yoonsie Kim on 11/23/16.
//  Copyright © 2016 Yoonsie Kim. All rights reserved.
//

import UIKit

class Notecard: NSObject, NSCoding {
    
    //MARK: - Properties
    var nativeWord: String
    var japaneseWord: String
    var imageID: String
    
    
    //keys for the saved properties
    let nativeWordKey = "nativeWordKey"
    let japaneseWordKey = "japaneseWordKey"
    let imageIDKey = "imageIDKey"
    
    
    // MARK: - Constructor
    override init() {
        //default native word
        nativeWord = NSLocalizedString("Enter a word to study e.g. dog", comment: "Enter a word to study e.g. dog")
        
        //default japanese word
        japaneseWord = "e.g. 犬"
        
        //default image ID
        imageID = NSUUID().uuidString
    }
    
    
    
    // MARK: - Functions
    // decodes (deserializes) a caption
    required init(coder aDecoder: NSCoder) {
        nativeWord = aDecoder.decodeObject(forKey: nativeWordKey) as! String
        japaneseWord = aDecoder.decodeObject(forKey: japaneseWordKey) as! String
        imageID = aDecoder.decodeObject(forKey: imageIDKey) as! String
    }
    
    
    // encodes (serializes) a caption
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nativeWord, forKey: nativeWordKey)
        aCoder.encode(japaneseWord, forKey: japaneseWordKey)
        aCoder.encode(imageID, forKey: imageIDKey)
    }
    
    
}//end class
