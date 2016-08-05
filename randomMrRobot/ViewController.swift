//
//  ViewController.swift
//  randomMrRobot
//
//  Created by Paige Walters on 7/19/16.
//  Copyright © 2016 Paige Walters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let quotes = ["We are in a war, and we are on the losing side of it.\nWe are on our knees with guns to our heads, and they are picking us off one by one.", "How do I take off a mask when it stops being a mask?\nWhen it's as much a part of me as me?", "Control is an illusion.", "Why this mask?\nIt's a bit silly, isn't it?", "In that moment, it's just you and absolute power.\nNothing else. That moment stayed with me.\nI thought I'd feel guilty for being a murderer but... I don't.\nI feel wonder.", "Corporate greed is a trickle down desire\nthat reaches even the bottom of the food chain."]

    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!

    @IBOutlet weak var scoreLabel: UILabel!
    
    var correctAnswers = "0"
    var usersAnswer = "Darlene"
    var stringAnswer = "Darlene"
    var score = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func randomQuote() -> String {
        let idx = Int(arc4random_uniform(UInt32(quotes.count)))
        return quotes[idx]
    }
    
    func setupView() {
        //displaying score
        scoreLabel.text = "Your Score Is Currently: \(score)"
        // adds borders to buttons
        let buttons = [buttonOne, buttonTwo, buttonThree, buttonFour]
        for button in buttons {
            buttonBorders(button)
        }
        //sets quote
        quoteLabel.text = randomQuote()
        //finding the index of the quote for the answer
        answerIndex()
    }
    
    func buttonBorders(button: UIButton) {
        button.backgroundColor = UIColor.clearColor()
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red:0.83, green:0.13, blue:0.15, alpha:1.0).CGColor
    }
    
    func correctAnswer() {
            switch correctAnswers {
            case "0":
                stringAnswer = "Darlene"
                print("\(correctAnswers) is Darlene")
            case "1":
                stringAnswer = "Elliot"
                print("\(correctAnswers) is Elliot")
            case "2":
                stringAnswer = "Mr. Robot"
                print("\(correctAnswers) is Mr. Robot")
            case "3":
                stringAnswer = "Tyrell"
                print("\(correctAnswers) is Tyrell")
            case "4":
                stringAnswer = "Tyrell"
                print("\(correctAnswers) is Tyrell")
            case "5":
                stringAnswer = "Darlene"
                print("\(correctAnswers) is Darlene")
            default:
                print("\(correctAnswers) that is not the answer")
            }
        

        comparingAnswers()
    }
    
    func comparingAnswers(){
        if usersAnswer == stringAnswer {
            self.score += 1
            self.performSegueWithIdentifier("answerSegue", sender: nil)
//            
//            let alertController = UIAlertController(title: "Correct", message: "You're freaking awesome!", preferredStyle: .Alert)
//            
//            let cancelAction = UIAlertAction(title: "Next", style: .Cancel) { (action) in
//                print("This is the score \(self.score)")
//                self.setupView()
//                self.answerIndex()
//            }
//            alertController.addAction(cancelAction)
//          
//            
//            
//            self.presentViewController(alertController, animated: true) {
//                // ...
//            }
//
            print("YOU ARE CORRECT! :)")
        } else {
            self.performSegueWithIdentifier("answerSegue", sender: nil)
//
            print("Try Again :(")
            
//            let alertController = UIAlertController(title: "Incorrect", message: "Better luck next time, buddy!", preferredStyle: .Alert)
//            
//            let cancelAction = UIAlertAction(title: "Next", style: .Cancel) { (action) in
//                self.setupView()
//                self.answerIndex()
//            }
//            alertController.addAction(cancelAction)
//            
//      
//            self.presentViewController(alertController, animated: true) {
//                // ...
//            }
        }
    }
    func answerIndex() {
        let answerIndex = quotes.indexOf(quoteLabel.text!)!
        correctAnswers = "\(answerIndex)"
        print(answerIndex)
    }



    @IBAction func buttonOne(sender: AnyObject) {
        print(sender.currentTitle!!)
        usersAnswer = sender.currentTitle!!
        correctAnswer()
        
    }
    
    @IBAction func buttonTwo(sender: AnyObject) {
        print(sender.currentTitle!!)
        usersAnswer = sender.currentTitle!!
        correctAnswer()
    }
    
    @IBAction func buttonThree(sender: AnyObject) {
        print(sender.currentTitle!!)
        usersAnswer = sender.currentTitle!!
        correctAnswer()
    }
    @IBAction func buttonFour(sender: AnyObject) {
        print(sender.currentTitle!!)
        usersAnswer = sender.currentTitle!!
        correctAnswer()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let secondVC: ModalViewController = segue.destinationViewController as! ModalViewController
        
        secondVC.usersAnswer = "\(score)"
    }
}
