//
//  ViewController.swift
//  kage
//
//  Created by Yoonsie Kim on 11/19/16.
//  Copyright © 2016 Yoonsie Kim. All rights reserved.
//


import UIKit


class ImageBrowserViewController: UIViewController {
    
    
    // MARK: Outlets / properties
    @IBOutlet var urlField: UITextField! //text field to type in the url of image
    @IBOutlet var imageView: UIImageView!//image view for image to be shown
    
    var imageFetcher: ImageFetcher!//image fetcher model
    
 
    // MARK: view did load method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.masksToBounds = true
        
        imageFetcher = ImageFetcher()//model
        
        //textfield clear button addition
        urlField.clearButtonMode = UITextFieldViewMode.whileEditing
       
    }
    
    // MARK: Fetch image
    @IBAction func fetchImage(_ sender: Any) {
        
        //get input url from textfield
        let url = urlField.text!
        
        //call model's fetch image method to try to get the image
        imageFetcher.fetchImage(url: url) {
            (fetchResult) -> Void in
            //switch fetch result, upon success set the imageview's image to the image
            //on failure, show the invalid image, image
            switch(fetchResult) {
            case let .ImageSuccess(image):
                OperationQueue.main.addOperation() {
                    self.imageView.image = image
                }
            case let .ImageFailure(error):
                OperationQueue.main.addOperation {
                    self.imageView.image = #imageLiteral(resourceName: "oops")
                }
                print("error: \(error)")//print error
            }
            
        }
    }
    
    //dismiss textfield's keyboard after typing the view
    @IBAction func dismissKeyboard(_ sender: AnyObject) {
        urlField.resignFirstResponder()
    }
    
    
}
