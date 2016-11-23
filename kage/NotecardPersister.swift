//
//  NotecardPersister.swift
//  kage
//
//  Created by Yoonsie Kim on 11/23/16.
//  Copyright © 2016 Yoonsie Kim. All rights reserved.
//


import UIKit

class NotecardPersister: NSObject {
    
    
    //save the NSURL as archive URL for the notecard
    static let notecardArchiveURL: NSURL = {
        
        ///creates constant that refers to Dodcuments directory in the app's sandbox
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        let documentDirectory = documentsDirectories.first!//returns array but "first" is used  to get that url
        
        //new URL is created that includes the name of the file that will be used to store instances of the Notecard Class
        return documentDirectory.appendingPathComponent("notecard.archive") as NSURL
    }()
    
    
    //returns the notecard
    class func getNotecard() -> Notecard {
        
        //code needs to be added to unarchive an instance that was previously save
        if let notecard = NSKeyedUnarchiver.unarchiveObject(withFile: notecardArchiveURL.path!) as? Notecard {
            return notecard//returns the saved notecard
        }
            
            //if app is launched for the first time
        else {
            //new isntance is returned
            return Notecard()
        }
    }
    
    class func setNotecard(_ notecard: Notecard) -> Bool {
        return NSKeyedArchiver.archiveRootObject(notecard, toFile: notecardArchiveURL.path!)
    }
    
    
}
