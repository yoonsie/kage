//
//  AnimationsViewController.swift
//  Project01
//
//  Created by Yoonsie Kim on 11/5/16.
//  Copyright © 2016 Yoonsie Kim. All rights reserved.
//

import UIKit

class AnimationsViewController: UIViewController {
    
    @IBOutlet var firstLabel: UILabel!
    
    @IBOutlet var secondLabel: UILabel!
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var animateButton: UIButton!
    

    @IBOutlet var secondLabelVertical: NSLayoutConstraint!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //adds clear "x" button while text field is in editing mode
        textField.clearButtonMode = UITextFieldViewMode.whileEditing
        
    }
    
    //Updates labels using input from first text field
    @IBAction func userInputText(_ textfield: UITextField) {
        if let inputText = textField.text {//unwrap value of text in the textfield
            
            firstLabel.text = inputText //updates text of first label
            secondLabel.text = inputText //and of second label
        }
    }
    
    //Dismisses keyboard for textfield
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    
    @IBAction func animate(sender: AnyObject) {
        animateBackground()
        animateFirstLabel()
        animateSecondLabel()
    }
    
    func animateFirstLabel() {
        UIView.animate(
            withDuration: 2.0,
            delay: 0,
            options: [],
            animations: { () -> Void in
                self.firstLabel.alpha = 0.0
                
            },
            completion: { (Bool) -> Void in
               UIView.animate(
                    withDuration: 1.0,
                    animations: { () -> Void in
                     self.firstLabel.alpha = 1.0
               })
        })
    }
    
    func animateSecondLabel() {
        UIView.animate (
            withDuration: 1.0,
            delay: 0,
            options: [],
            animations: { () -> Void in
                self.secondLabelVertical.constant += self.view.frame.height
                self.view.layoutIfNeeded()
            },
            completion: { (Bool) -> Void in
                UIView.animate(
                    withDuration: 1.0,
                    animations: { () -> Void in
                        self.secondLabelVertical.constant -= self.view.frame.height
                        self.view.layoutIfNeeded()
                    }
                )
            }
        )
    }
    
    //animates the UIView's background color to dark gray and then back to white
    func animateBackground() {
        UIView.animate(
            withDuration: 2.0,
            delay: 0,
            options: [],
            animations: { () -> Void in
                self.view.backgroundColor = UIColor.darkGray
            },
            completion: { (Bool) -> Void in
                UIView.animate(
                    withDuration: 1.0,
                    animations: { () -> Void in
                        self.view.backgroundColor = UIColor.white
            })
        })
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}
