_____________________________________
Contact

Author: Yoonsie Kim
Contact: ykim95@u.rochester.edu
CSC 214
TA: Kyle Ryan
Project 02
Due: Wednesday, November 28, 2016 23:59
_____________________________________
Files

Project01 Folder		The files
SampleOutput_Project01		Screenshots of Project01 app
README_Project02.txt


_____________________________________
Information

Requirements:
a. A launch screen, a custom launcher icon, localization of all user-facing strings.b. At least one navigation controller that manages segues between multiple viewcontrollers.c. You must implement persistence including:	i. Model data: any information entered by the user or stored as part of the model should be saved across application restarts.	ii. You must allow users to choose an image from the camera roll and save it.	iii. You must allow the users to use the camera to take a photo and save it.d. Your user interface should make significant use of stack views, both horizontal andvertical, whenever appropriate.



_________________
Instructions:

1. Swipe left to move from first view to next view
2. Press “Play” or “Study” button
3. If you press “Study” you can press “<“ button to go back and play, if you play the game, however, you cannot go back to study
4. Draw Kanji within 4 seconds. Press “next” if you finish early
_________________


Additions to previous Project (#2):

- All views are stack views and orientation will not cause issues
- Added more user-facing strings and localized them 
- Timer added to DrawingViewController.swift: User must complete each Kanji within 4 seconds or it will move on to the next one, if they have extra time, they can press the “next” button
-Added swipe gesture to first screen

-PhotoController.swift : View Controller that allows the user to take a photo with a camera or pick a photo from their library, and write an English word and Japanese translation they want to memorize. This information is saved using:
	: AppDelegate.swift
	: ImageHelper.swift - helps save the images
	: Notecard.swift (which contains a word in the native language, Japanese translation, and id for image) also encodes and decodes the data
	: NotecardPersistor.swift helps retrieve the data (notecard) and save/set it


_________________


Swift Files:


DrawingViewController.swift - the Controller
   - This controller uses UIGraphics to and UITouch event detection to allow the user to draw on the UIView or drawing board.  The kanji shown and its respective number of strokes is taken from the model (KanjiHelper.swift).  The user’s touch is also detected and saved, then displayed on a label on the view.  User can also click the “next” button to get the next kanji character and also can press the “x” button to reset the drawing board.

KanjiCharacter.swift
   - A kanji character is defined by its Kanji (string) and the number of strokes it has

KanjiHelper.swift - The Model
   - Has a property, kanjiArray, that already has an array of Kanji Characters initialized
   - Returns the next Kanji at random from array, removes the returned kanji so it is not repeated


——

Word.swift
   - Represents a word that will be an item of the table, has a Japanese word hardcoded, word for native speaker (localized), and image file representing that word


WordManager.swift  - The Model
   - Has an array of words already initialized, localizes the “native” aspect of the word but the Japanese is hardcoded for learning purposes
   - Has methods for adding, removing, and moving the word within the property “words” which is an array of words


WordTableViewController.swift - Controller
   - Custom table cells used with image file and label for Japanese hardcoded and the native language of the user (localized)
   - Editing mode is enabled, user can delete or move rows
   - Initially the words are already added for the user






_____________________________________
Honor Code

I affirm that I have neither given nor received any unauthorized aid on this homework and all work is my own.


_____________________________________
Acknowledgements

- Icon made by Roundicons from www.flaticon.com
- BR Studio on YouTube tutorial for making a drawing app (https://www.youtube.com/watch?v=-KOFYD4Tbvk)
- This project was built on my Project 2