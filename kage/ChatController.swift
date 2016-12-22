//
//  ChatController.swift
//  kage
//
//  Created by Yoonsie Kim on 12/13/16.
//  Copyright © 2016 Yoonsie Kim. All rights reserved.

import Foundation
import UIKit
import MultipeerConnectivity

class ChatController: UIViewController, MCBrowserViewControllerDelegate, MCSessionDelegate {
    
    
    let serviceType = "kage-chatroom"
    
    //MultipeerConnectivity stuff
    var browser: MCBrowserViewController! //browser (view for finding other users to connect to)
    var assisant: MCAdvertiserAssistant! //assistant (for advertising)
    var session: MCSession! //session (of connection)
    var peerID: MCPeerID! //peerID - person you are connecting to
    
    // -     MARK: Outlets
    
    //view where the sent/received chat messages are seen
    @IBOutlet var chatView: UITextView!
    
    //textfield to type in message
    @IBOutlet var inputMessageField: UITextField!


    //MARK: view did load fcn
    override func viewDidLoad() {
        super.viewDidLoad()

        //session configuration
        peerID = MCPeerID(displayName: UIDevice.current.name) //this device's id
        session = MCSession(peer: peerID) //session for this device
        session.delegate = self //self is delegate
        
        //browser configuration (browser view controller to display to user to pick /browse for other users)
        browser = MCBrowserViewController(serviceType: serviceType, session: session) //browser for service type and session
        browser.delegate = self //make self delegate
        
        
        //assistant configuration (advertiser)
        assisant = MCAdvertiserAssistant(serviceType: serviceType, discoveryInfo: nil, session: session)//make assistant
        assisant.start()//start assistant for advertising
        
        //add clear button to textfield
        inputMessageField.clearButtonMode = UITextFieldViewMode.whileEditing

    }
    
    //dismiss keyboard when tapping out of textfield
    @IBAction func dismissKeyboard(_ sender: AnyObject) {
        inputMessageField.resignFirstResponder()
    }
    
    
    
    // MARK: Sending chat/data
    @IBAction func sendChat(sender: UIButton) {
        
        //save message from textfield input by user
        let message = inputMessageField.text?.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        do {
            //try to send mession in session
            try session.send(message!, toPeers: session.connectedPeers, with: .unreliable)
        } catch let error as NSError {
            print("Error sending data: \(error.localizedDescription)")//print to console error on fail
        }
        
        //update chat view (textview) using message field text
        updateChat(text: inputMessageField.text ?? "", fromPeer: peerID)
        
        //reset textfield
        inputMessageField.text = ""
    }
    
    
    // Updates the text view with new chat messages
    func updateChat(text: String, fromPeer peerID: MCPeerID) {
        var name: String
        
        //uses peerID received to show chat message based on that peer ID
        switch peerID {
        case self.peerID://if peer id is self, then name is "Me"
            name = "Me"
        default:
            name = peerID.displayName//default is the display name of given peer id
        }
        
        //message string format
        let message = "\(name): \(text)\n"
        
        //append message to the chatview/textview text
        chatView.text = chatView.text + message
    }
    
    
    
    // MARK: MCBrowserViewControllerDelegate methods
    //  Show browser
    @IBAction func showBrowser(sender: UIButton) {
        present(browser, animated: true, completion: nil)//show view controller for browsing for peers to connect to
    }
    
    
    // When completion is pressed, dismiss vc
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true, completion: nil)
        
    }
    
    //  When cancel is pressed, dismiss vc
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true, completion: nil)
    }

    
    // MARK: Delegate methods for MCSessionDelegate
    // Data received
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        
        DispatchQueue.main.sync() {
            
            //msg
            let msg = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)
            
            //update chat view with message as string from the pper
            self.updateChat(text: msg as! String, fromPeer: peerID)
            
            print("data received")
        }
    }
    
    // Start receiving data
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        print("Start receiving data")
        
        
    }
    
    // Data reception over
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL, withError error: Error?) {
        print("data reception over")
        
    }
    
    // Stream established
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        print("Strem established")
        
    }
    
    //  When state of another peer changes
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        print("peer state changed")
    }
    
    
    
    
    
    
    //unused lifecycle function
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}//end class chat controller
