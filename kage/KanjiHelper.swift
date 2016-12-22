//
//  KanjiHelper.swift
//  Project01
//
//  Created by Yoonsie Kim on 11/23/16.
//  Copyright © 2016 Yoonsie Kim. All rights reserved.
//

import UIKit


class KanjiHelper: NSObject {
    
    //array of kanji characters:
    var kanjiArray: [KanjiCharacter] =
        [KanjiCharacter("一", 1),
         KanjiCharacter("二", 2),
         KanjiCharacter("子", 2),
         KanjiCharacter("人", 2),
         KanjiCharacter("犬", 4),
         KanjiCharacter("家", 10),
         KanjiCharacter("学", 7),
         KanjiCharacter("海", 9),
         KanjiCharacter("女", 3),
         KanjiCharacter("男", 7),
         KanjiCharacter("高", 10),
         KanjiCharacter("千", 3),
         KanjiCharacter("年", 6),
         KanjiCharacter("母", 5),
         KanjiCharacter("父", 4),
         
    ]
    
    
    //get next kanji character to practice
    func getNextKanji() -> [String] {
        
        
        let randomIndex = Int(arc4random_uniform(UInt32(kanjiArray.count)))//random integer to be used
        let kanjiToReturn = kanjiArray[randomIndex]//get the value at the random index
        
        
        kanjiArray.remove(at: randomIndex)//remove value at random Index after using it
        
        //return as array of two string to make it easier for labels
        return [kanjiToReturn.kanji, String(kanjiToReturn.strokes)]
        
    }
    
    
    
    
    
    
}
