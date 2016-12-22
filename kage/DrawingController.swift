//
//  DrawingController.swift
//  kage
//
//  Created by Yoonsie Kim on 11/19/16.
//  Copyright © 2016 Yoonsie Kim. All rights reserved.
//
//  Drawing Controller has the kanji drawing game

import UIKit


class DrawingController: UIViewController {
    
    // - MARK: Properties
    @IBOutlet var timer: UILabel!// label for the timer showing how many seconds user has
    @IBOutlet var kanjiLabel: UILabel! //label for the kanji character that must be drawn
    @IBOutlet var kanjiStrokesLabel: UILabel! //label for the # of strokes for the kanji character
    @IBOutlet var yourStrokesLabel: UILabel! //label for user's number of strokes
    
    @IBOutlet var canvas: UIImageView!//canvas is the drawing canvas
    
    //last point is starting at 0
    var lastPoint = CGPoint.zero //the last point of the user's uitouch
    var swiped = false//initial swipe status is false
    
    //user's number of strokes starts at 0
    var numberOfStrokes: Int = 0
    
    //model
    let model = KanjiHelper()
    
    //counter for timer
    var counter = 5
    
    
    
    
    
    // - MARK: Methods
    
    //viewDidLoad function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up initial kanji to be shown by getting next kanji from model
        var kanji: [String] = model.getNextKanji()
        kanjiLabel.text = kanji[0]//value at first part of array is the kanji character
        
        //update label for the # of kanji strokes
        kanjiStrokesLabel.text = NSLocalizedString("# of strokes: ", comment: "# of strokes: ") + kanji[1]
    
        
        //start timer, interval is 1 seconds, repeats
        var _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

    }
    
    
    //this function updates the counter, which is used for the timer/number of seconds for each character that is shown
    func updateCounter() {
        //you code, this is an example
        if counter > 0 {
            
            timer.text = NSLocalizedString("Timer: ", comment: "Timer: ") + String(counter)
            
            
            //decrement counter
            counter -= 1
            
        }
        
        if counter == 0 {
            reset()//reset # of strokes and drawing board / canvas
            
            counter = 5//reset counter
            
            //update label
            timer.text =  NSLocalizedString("Timer: ", comment: "Timer: ") + String(counter)//update timer label
            
            //update kanji
            getNextKanji()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        
        //if there is a touch
        if let touch = touches.first {
            
            //set location to the last point in the view
            lastPoint = touch.location(in: self.canvas)
        }
    }
    
    func drawLines(fromPoint:CGPoint,toPoint:CGPoint) {
        
        //graphics are within the size of the view's frame
        UIGraphicsBeginImageContext(self.canvas.frame.size)
        
        
        //draw the drawing board
        canvas.image?.draw(in: CGRect(x: 0, y: 0, width: self.canvas.frame.width, height: self.canvas.frame.height))
        
        let context = UIGraphicsGetCurrentContext()//context of graphics
        
        //to move the context of the graphics
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))//adds the line from the point
        
        context?.setBlendMode(CGBlendMode.normal)//normal blen dmode
        context?.setLineCap(CGLineCap.round) //sets linecap to round
        context?.setLineWidth(5)//change line width
        context?.setStrokeColor(UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor)//black stroke color
        
        context?.strokePath()
        
        canvas.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true//if a touch is detected, a swipe has been made
        
        //if there is a first touch, save as variable "touch"
        if let touch = touches.first {
            
            //save current oint
            let currentPoint = touch.location(in: self.canvas)
            
            //draw from the last point to the current point
            drawLines(fromPoint: lastPoint, toPoint: currentPoint)
            
            //re-set last point to current point to continuously draw
            lastPoint = currentPoint
            
        }
    }
    
    // increments the number of strokes each time the touch ends
    // draws the point using last point to current last point
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLines(fromPoint: lastPoint, toPoint: lastPoint)//if the touch is over, (swipe == false) finish drawing at last point
        }
        
        //increment # of strokes
        numberOfStrokes += 1
        print (numberOfStrokes)
        
        yourStrokesLabel.text = NSLocalizedString("Your # of strokes: ", comment:"Your # of strokes: ") + String(numberOfStrokes)
    }
    
    
    
    //helper function that resets the board, the number of strokes, etc
    func reset() {
        //reset drawing board
        self.canvas.image = nil
        
        //reset/update number of user's strokes
        numberOfStrokes = 0
        
        //update label user's number of strokes
        yourStrokesLabel.text = NSLocalizedString("Your # of strokes: 0", comment: "Your # of strokes: 0")
    }
    
    
    
    //uses model to get next kanji
    @IBAction func nextKanji(_ sender: AnyObject) {
        counter = 0//reset counter/coutndown to 0
        
        //reset timer before new kanji
        updateCounter()
        
        //reset the canvas or drawing board
        reset()
        
        getNextKanji()//get next kanji
        
        
        
    }
    
    func getNextKanji() {
       
        //if there are no more kanji left from the model, don't display anything
        if (model.kanjiArray.isEmpty) {
            kanjiLabel.text = " "//display empty string
        }
        
        //otherwise, get more kanji if there are more in the model 
        else {
            var kanji = model.getNextKanji()
            
            //change text to appropriate character
            kanjiLabel.text = kanji[0]
            
            //update the actual number of strokes for new kanji
            kanjiStrokesLabel.text = NSLocalizedString("# of strokes: ", comment: "# of strokes: ") + kanji[1]
        }

    }
    
    
    

    
    
    // - UNUSED LIFECYCLE FUNCTIONS
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
   
}
