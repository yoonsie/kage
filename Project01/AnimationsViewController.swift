//
//  AnimationsViewController.swift
//  Project01
//
//  Created by Yoonsie Kim on 11/5/16.
//  Copyright © 2016 Yoonsie Kim. All rights reserved.
//

import UIKit

class AnimationsViewController: UIViewController {
    
    
    //Properties
    
    
    @IBOutlet var firstLabel: UILabel!//first label with alpha animation
    
    @IBOutlet var secondLabel: UILabel!//second label with constraint animation
    
    @IBOutlet var textField: UITextField!//textfield
    
    @IBOutlet var animateButton: UIButton!//animation button that will animate the view
    

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
        textField.resignFirstResponder()//dismiss keyboard
    }
    
    
    //animates the view
    @IBAction func animate(sender: AnyObject) {
        animateBackground()
        animateFirstLabel()
        animateSecondLabel()
    }
    
    
    //An alpha animation that fades the first label out and back in
    func animateFirstLabel() {
        UIView.animate(
            withDuration: 2.0,//2 seconds long
            delay: 0,
            options: [],
            animations: { () -> Void in
                self.firstLabel.alpha = 0.0//make invisible
                
            },
            completion: { (Bool) -> Void in
               UIView.animate(
                    withDuration: 1.0,
                    animations: { () -> Void in
                     self.firstLabel.alpha = 1.0//make visible again
               })
        })
    }
    
    //A constraint animation that moves the second label vertically then returns to original vertical position
    func animateSecondLabel() {
        UIView.animate (
            withDuration: 1.0,
            delay: 0,
            options: [],
            animations: { () -> Void in
                self.secondLabelVertical.constant += self.view.frame.height//add the view's height to second label vertical constraint
                self.view.layoutIfNeeded()
            },
            completion: { (Bool) -> Void in
                UIView.animate(
                    withDuration: 1.0,
                    animations: { () -> Void in
                        self.secondLabelVertical.constant -= self.view.frame.height//revert back to original height
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
                self.view.backgroundColor = UIColor.darkGray//makes dark gray
            },
            completion: { (Bool) -> Void in
                UIView.animate(
                    withDuration: 1.0,
                    animations: { () -> Void in
                        self.view.backgroundColor = UIColor.white//back to white
            })
        })
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}
