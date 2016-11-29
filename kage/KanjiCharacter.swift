//
//  KanjiCharacter.swift
//  Project01
//
//  Created by Yoonsie Kim on 11/23/16.
//  Copyright © 2016 Yoonsie Kim. All rights reserved.
//

import UIKit


class KanjiCharacter: NSObject {
    
    //properties:
    
    //the actual String for the kanji character (in Japanese)
    var kanji: String
    
    //the # of strokes for this specific kanji character
    var strokes: Int
    
    //constructor:
    init(_ kanji: String, _ strokes: Int) {
        self.kanji = kanji
        self.strokes = strokes
    }
    
    
}
