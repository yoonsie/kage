//
//  TableViewController.swift
//  Project01
//
//  Created by Yoonsie Kim on 11/23/16.
//  Copyright © 2016 Yoonsie Kim. All rights reserved.
//

import UIKit

class WordTableViewController: UITableViewController {
    
    var model: WordManager!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Positioning purposes to make sure the table is below the status bar and above the tab bar controller
        let statusBarHeight = UIApplication.shared.statusBarFrame.height//save height of status bar
//        let tabHeight = self.tabBarController!.tabBar.frame.size.height//get height of the tab bar on bottom
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        
        //set insets
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        //estimated row heights (b/c dynamic type is enabled)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 70
        
        //set models
        model = WordManager()
       
        //if the model does have words to add
        if (model.words.isEmpty == false) {
            
            //iterate through all the existing words in the array and insert rows
            for word in model.words {
                let index = model.words.index(of: word)
                let indexPath = NSIndexPath(row: index!, section: 0)
                tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
            }
            
        }//if
    }
    
    
    
    //Get table cell and recycling them
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath) as! WordCell
        
        //save word taken from model using the indexPath's row
        let word = model.words[indexPath.row]
        
        //update the cell's Japanese, Native Language and picture
        cell.japaneseLabel?.text = "\(word.japanese)"
        cell.nativeLabel?.text = "\(word.native)"
        
        var imageFileName = ""
        
        //if the file name exists
        if word.imageFile.isEmpty == false {
            imageFileName = word.imageFile
            cell.picture?.image = UIImage(named: imageFileName)

        }
 
        
                
        // returns the cell
        return cell
    }
    
    
    //Toggle edit mode with +Edit button
    @IBAction func toggleEditMode(_ sender: UIButton) {
        
        //if not editing allow editing true
        if isEditing == false {
            setEditing(true, animated: true)
            sender.setTitle(NSLocalizedString("Done", comment: "Done"), for: .normal)
        }
            
            //change label
        else {
            setEditing(false, animated: true)
            sender.setTitle(NSLocalizedString("Edit", comment: "Edit"), for: .normal)
        }
    }
    
    
    //For deleting a table cell
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            //save word to be deleted
            let word = model.words[indexPath.row]
            
            //remove word from model and table
            model.removeWord(word)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    //returns number of rows in each section but there is only one section for this table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.words.count
    }
    
    
    //move a table row in editing mode
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        model.moveWord(sourceIndexPath.row, destinationIndexPath.row)
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
