//
//  WordManager.swift
//  Project01
//
//  Created by Yoonsie Kim on 11/5/16.
//  Copyright © 2016 Yoonsie Kim. All rights reserved.
//

import UIKit

class WordManager: NSObject {
    
    //initialize empty array of words
    var words: [Word] =
        [Word("犬", NSLocalizedString("dog", comment: "dog"), "dog.png"),
         Word("猫", NSLocalizedString("cat", comment: "cat"), "cat.png"),
         Word("家", NSLocalizedString("house", comment: "house"), "house.png"),
         Word("人", NSLocalizedString("person", comment: "person"), "person.png"),
         Word("一", NSLocalizedString("one", comment: "one"), "one.png"),
         Word("二", NSLocalizedString("two", comment: "two"), "two.png"),
         Word("三", NSLocalizedString("three", comment: "three"), "three.png"),
         Word("四", NSLocalizedString("four", comment: "four"), "four.png"),
         Word("五", NSLocalizedString("five", comment: "five"), "five.png"),
         Word("六", NSLocalizedString("six", comment: "six"), "six.png"),
         Word("七", NSLocalizedString("seven", comment: "seven"), "seven.png"),
         Word("八", NSLocalizedString("eight", comment: "eight"), "eight.png"),
         Word("九", NSLocalizedString("nine", comment: "nine"), "nine.png"),
         Word("十", NSLocalizedString("ten", comment: "ten"), "ten.png")]
    
    
    
    
    //adds word to array of words
    func addWord(_ word: Word) -> Int {
        words.append(word)
        return words.index(of: word)!
    }
    
    //removes word from array
    func removeWord(_ word: Word) {
        //if the word exists in array
        if let index = words.index(of: word) {
            words.remove(at: index)
        }
    }
    
    //move word in array
    func moveWord(_ fromIndex: Int, _ toIndex: Int) {
        if fromIndex != toIndex {//if source and destination are not the same
            let word = words[fromIndex] //save word to be moved
            words.remove(at: fromIndex) //remove word from source index
            words.insert(word, at: toIndex) //put word into destination index
        }
    }
    
    
    
    
    
    
    
    
}
