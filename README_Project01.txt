_____________________________________
Contact

Author: Yoonsie Kim
Contact: ykim95@u.rochester.edu
CSC 214
TA: Kyle Ryan
HW 07
Due: Wednesday, November 2, 2016 23:59
_____________________________________
Files

Project01 Folder		The files
SampleOutput_Project01		Screenshots of Project01 app
kanjiapp.pdf			1-page description of app
README.txt


_____________________________________
Information

Requirements:
Launch screen, Icon, Localization of all user-facing strings (except Japanese since the purpose is to learn Japanese), Constraints that work with double length pseudo language, tab bar controller with 2+ tabs with custom icons, table view supports editing and uses custom table cells, alpha, constraint, and color animations, text field that validates user input but changing labels.

Swift Files:

AnimationsViewController.swift
   - The user can type in the text field to update the labels below it while editing
   - When the animate button is pressed 3 things happen:
	(1) The view’s background color animates to a dark gray and back to white
	(2) The first label fades out then back in
	(3) The second label moves vertically then back to its original height


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

—-

KanjiCharacter.swift
   - A kanji character is defined by its Kanji (string) and the number of strokes it has

KanjiHelper.swift - The Model
   - Has a property, kanjiArray, that already has an array of Kanji Characters initialized
   - Returns the next Kanji at random from array, removes the returned kanji so it is not repeated

DrawingViewController.swift - the Controller
   - This controller uses UIGraphics to and UITouch event detection to allow the user to draw on the UIView or drawing board.  The kanji shown and its respective number of strokes is taken from the model (KanjiHelper.swift).  The user’s touch is also detected and saved, then displayed on a label on the view.  User can also click the “next” button to get the next kanji character and also can press the “x” button to reset the drawing board.

_____________________________________
Extra Credit

- Added 3 animations (alpha, constraint, and color)
- Also used UIGraphics and TouchEvents for making a drawing board since the requirements for this project were not related to my application
- Added picture to custom table cell for table

_____________________________________
Honor Code

I affirm that I have neither given nor received any unauthorized aid on this homework and all work is my own.


_____________________________________
Acknowledgements

- Icon made by Roundicons from www.flaticon.com
- BR Studio on YouTube tutorial for making a drawing app (https://www.youtube.com/watch?v=-KOFYD4Tbvk)
- HW 2 for text field delegates
