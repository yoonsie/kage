//
//  PhotoController.swift
//  kage
//
//  Created by Yoonsie Kim on 11/22/16.
//  Copyright © 2016 Yoonsie Kim. All rights reserved.
//

import UIKit

class PhotoController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet var nativeLabel: UILabel!
    @IBOutlet var nativeTextField: UITextField!
    
    @IBOutlet var japaneseLabel: UILabel!
    @IBOutlet var japaneseTextField: UITextField!
    
    
    @IBOutlet var imageView: UIImageView!
    
    
    
    //notecard that is saved
    var notecard: Notecard!
    
    // MARK: - methods
    
    //Takes photo if user has a camera
    @IBAction func takePhoto(_ sender: AnyObject) {
        let cameraButton = sender as? UIButton
        
        let picker = UIImagePickerController() //create instance of image picker
        
        //if the device has a camera let the user take a photo
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera//source type is camera
            print ("Camera selected")
            
            picker.delegate = self //set the delegate of the picker to view controller
            
            //give control over to picker
            present(picker, animated: true, completion: nil)
            
            
        }
            
        //no camera, disable this camera take photo button
        else {
            cameraButton?.isUserInteractionEnabled = false
            cameraButton?.isEnabled = false
            print("You do not have a camera so camera button is disabled")
        }
        
    }
    
    
    
    // Picks photo from library
    @IBAction func pickPhoto(_ sender: AnyObject) {
        
        //save image picker as variable picker
        let picker = UIImagePickerController()
        
        //if the device has a photo library
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            picker.sourceType = .photoLibrary//make source type for picker the library
            print("Photo library selected")//print statement
            
            picker.delegate = self //set the delegate of the picker to view controller
            
            //give control over to picker
            present(picker, animated: true, completion: nil)
        }
        
    }
    
    
    // MARK: - image picker delegate methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        //save photo that was picked by user
        let photo = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        
        //store this photograph
        ImageHelper.saveImage(photo, forUID: notecard.imageID)
        
        
        //set the outlet's image imageView to the one selected
        imageView.image = photo
        
        //return controller to view controller
        dismiss(animated: true, completion: nil)
        
    }
    
    //updates the saved notecard using the text entered into the textfield
    @IBAction func updateNativeWordInNotecard(nativeTextField: UITextField) {
        
        //if the native text field input has changed
        if let nativeInput = nativeTextField.text {
        
            notecard.nativeWord = nativeInput
        }
    }
    
    //updates japanese word in the saved notecard
    @IBAction func updateJapaneseWordInNotecard(japaneseTextField: UITextField) {
        //if japanese text field input has changed
        if let japaneseInput = japaneseTextField.text {
            
            notecard.japaneseWord = japaneseInput
        }
    }

    

    //dismiss keyboard for both text fields
    @IBAction func dismissKeyboard(_ sender: AnyObject) {
        nativeTextField.resignFirstResponder()
        japaneseTextField.resignFirstResponder()
    }
    
    
    // MARK: - Lifecycle functions
    
    
    
    //view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //if image helper returns a saved image, sets the image to that saved one
        if let img = ImageHelper.getImage(forUID: notecard.imageID) {
            //let image view's image equal the saved image
            imageView.image = img
        }
            
        //update textfield text to the saved words in the notecard
        nativeTextField.text = notecard.nativeWord
        japaneseTextField.text = notecard.japaneseWord
        
        //add clear "X" button to textfields
        nativeTextField.clearButtonMode = UITextFieldViewMode.whileEditing
        japaneseTextField.clearButtonMode = UITextFieldViewMode.whileEditing

        
    }
    
    //memory warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
