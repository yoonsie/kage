//
//  ImageHelper.swift
//  HW09
//
//  Created by Yoonsie Kim on 11/23/16.
//  Copyright © 2016 Yoonsie Kim. All rights reserved.
//

import UIKit

class ImageHelper: NSObject {
    
    
    //save image function
    class func saveImage(_ image: UIImage, forUID uid: String) {
        let imageURL = ImageHelper.imageURLForUID(uid)//saves unique ID as image url
        
        //if jpeg representation exists then save as data
        if let data = UIImageJPEGRepresentation(image, 0.5) {
            
            //writes data for image
            do {
                try data.write(to: imageURL, options: .atomic)
            }
                
                //if unable to save, prints statement
            catch {
                print("could not save \(uid)")
            }
        }
    }
    
    //get image returns image if there is one
    class func getImage(forUID uid: String) -> UIImage? {
        let imageURL = ImageHelper.imageURLForUID(uid)//saves URL for the unique ID
        
        //        if image exists using the imageURL then save as image from disk, otherwise return nil
        guard let imageFromDisk = UIImage(contentsOfFile: imageURL.path) else {
            return nil
        }
        
        //return image
        return imageFromDisk
    }
    
    
    //returns URL of image for the unique ID
    class func imageURLForUID(_ key: String) -> URL {
        //save documents directory as constant
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        //saves first of the array
        let documentDirectory = documentsDirectories.first!
        
        //return the directory URL using the key for the image (Unique id)
        return documentDirectory.appendingPathComponent(key)
    }
}
