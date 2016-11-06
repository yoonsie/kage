//
//  TableViewController.swift
//  Project01
//
//  Created by Yoonsie Kim on 11/5/16.
//  Copyright © 2016 Yoonsie Kim. All rights reserved.
//

import UIKit

class WordTableViewController: UITableViewController {
    
    var model: WordManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let tabHeight = self.tabBarController!.tabBar.frame.size.height//get height of the tab bar on bottom
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: tabHeight, right: 0)
        
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 70
        
        model = WordManager();
        
        if (model.words.isEmpty == false) {
            
            //iterate through all the existing words in the array
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
        
        let word = model.words[indexPath.row]
        cell.japaneseLabel?.text = "\(word.japanese)"
        cell.nativeLabel?.text = "\(word.native)"
        let imageFileName = word.imageFile
        cell.picture?.image = UIImage(named: imageFileName)
        return cell
    }
    

    //Toggle edit mode with +Edit button
    @IBAction func toggleEditMode(_ sender: UIButton) {
        if isEditing == false {
            setEditing(true, animated: true)
            sender.setTitle("Done", for: .normal)
        }
        else {
            setEditing(false, animated: true)
            sender.setTitle("Edit", for: .normal)
        }
    }
    
    
    //For deleting a table cell
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
       
        if editingStyle == .delete {
            let word = model.words[indexPath.row]
                model.removeWord(word)
                tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.words.count
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
