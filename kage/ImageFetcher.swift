//
//  ImageFetcher.swift
//  kage
//
//  Created by Yoonsie Kim on 12/11/16.
//  Copyright © 2016 Yoonsie Kim. All rights reserved.
//

import UIKit

enum ImageFetchError: Error {
    case BadURL
    case ImageFetchFailed
}

enum ImageFetchResult {
    case ImageSuccess(UIImage)
    case ImageFailure(Error)
}

class ImageFetcher {
    
    //save variable for url session
    let session = URLSession(configuration: URLSessionConfiguration.default)
    
    // MARK: Fetch Image method
    // fetches image of URL with url request
    func fetchImage(url: String, completion: @escaping (ImageFetchResult) -> Void) {
        if let imageURL = URL(string: url) {
            let request = URLRequest(url: imageURL)
            
            //save task
            let task = session.dataTask(with: request) {
                (data, response, error) -> Void in
                
                //if image data can be saved, then save image as variable 'image'
                //on failure, then go to imagefailure error
                guard let imageData = data,
                    let image = UIImage(data: imageData) else {
                        if data == nil {
                            completion(.ImageFailure(error!))
                        }
                        else {
                            completion(.ImageFailure(ImageFetchError.ImageFetchFailed))
                        }
                        return
                }
                //on completion go to image success case
                completion(.ImageSuccess(image))
            }
            task.resume()//resume the task (session data task)
        }
            
        //if we can't unwrap url with given string, throw erro
        else {
            completion(.ImageFailure(ImageFetchError.BadURL))
        }
    }
}
