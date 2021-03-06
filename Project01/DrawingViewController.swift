//
//  DrawingViewController.swift
//  Project01
//
//  Created by Yoonsie Kim on 11/6/16.
//  Copyright © 2016 Yoonsie Kim. All rights reserved.
//

import UIKit

class DrawingViewController: UIViewController {
    
    //properties:
    
    @IBOutlet var kanjiLabel: UILabel!//label for kanji character to be drawn
    @IBOutlet var drawingBoard: UIImageView! //the drawing board
    @IBOutlet var actualNumberOfStrokes: UILabel! //label for the actual number of strokes for the kanji character
    @IBOutlet var yourNumberOfStrokes: UILabel!//label indicating how many strokes you have drawn so far
   
    
    //last point is starting at 0
    var lastPoint = CGPoint.zero
    var swiped = false//initial swipe status is false
    
    //user's number of strokes starts at 0
    var numberOfStrokes: Int = 0
    
    //model
    let model = KanjiHelper()
    
    //viewDidLoad function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //set up initial kanji to be shown by getting next kanji from model
        var kanji: [String] = model.getNextKanji()
        kanjiLabel.text = kanji[0]//value at first part of array is the kanji character
        actualNumberOfStrokes.text = NSLocalizedString("# of strokes: ", comment: "# of strokes: ") + kanji[1]
        
 
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        
        //if there is a touch
        if let touch = touches.first {
            
            //set location to the last point in the view
            lastPoint = touch.location(in: self.view)
        }
    }
    
    func drawLines(fromPoint:CGPoint,toPoint:CGPoint) {
        
        //graphics are within the size of the view's frame
        UIGraphicsBeginImageContext(self.view.frame.size)
        
      
        //draw the drawing board 
        drawingBoard.image?.draw(in: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
        let context = UIGraphicsGetCurrentContext()//context of graphics
        
        //to move the context of the graphics
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))//adds the line from the point
        
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(5)
        context?.setStrokeColor(UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor)
        
        context?.strokePath()
        
        drawingBoard.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true//if a touch is detected, a swipe has been made
        
        //if there is a first touch, save as variable "touch"
        if let touch = touches.first {
            
            //save current oint
            let currentPoint = touch.location(in: self.view)
            
            //draw from the last point to the current point
            drawLines(fromPoint: lastPoint, toPoint: currentPoint)
            
            //re-set last point to current point to continuously draw
            lastPoint = currentPoint
           
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLines(fromPoint: lastPoint, toPoint: lastPoint)//if the touch is over, (swipe == false) finish drawing at last point
            
            
        }
        
        numberOfStrokes += 1
        print (numberOfStrokes)
        
        yourNumberOfStrokes.text = NSLocalizedString("Your # of strokes: ", comment:"Your # of strokes: ") + String(numberOfStrokes)
    }
    
    

    
    @IBAction func reset(_ sender: AnyObject) {
        //reset drawing board
        self.drawingBoard.image = nil
        
        //reset/update number of user's trokes
        numberOfStrokes = 0
        
        //update label user's number of strokes
        yourNumberOfStrokes.text = NSLocalizedString("Your # of strokes: 0", comment: "Your # of strokes: 0")
        
    }
    
    @IBAction func nextKanji(_ sender: AnyObject) {
        self.drawingBoard.image = nil//reset
        
        //reset number of user's strokes counter
        numberOfStrokes = 0
        //reset your number of user's strokes for label too
        yourNumberOfStrokes.text = NSLocalizedString("Your # of strokes: 0", comment: "Your # of strokes: 0")

        
        if (model.kanjiArray.isEmpty) {
            kanjiLabel.text = " "
        }
        //get more kanji if there are more
        else {
            var kanji = model.getNextKanji()
            
            //change text to appropriate character
            kanjiLabel.text = kanji[0]
            
            //update the actual number of strokes for new kanji
            actualNumberOfStrokes.text = NSLocalizedString("# of strokes: ", comment: "# of strokes: ") + kanji[1]
        }
        
        
    }
    

 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
