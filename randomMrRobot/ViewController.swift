//
//  ViewController.swift
//  randomMrRobot
//
//  Created by Paige Walters on 7/19/16.
//  Copyright © 2016 Paige Walters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let quotes: [String: String] = [
    "Darlene_1" : "You wanna know who’s crazy? Those wall street psychos.",
    "Darlene_2" : "Jesus, I don’t normally say this, but I have got to Instagram this. People need to know this movie exists.",
    "Tyrell_1" : "I think about you a lot, Elliot. I think about that night. When we became gods.",
    "Ray_1"    :    "Control is about as real as a unicorn taking a leak at the end of a double rainbow.",
    "Elliot_1" : "If I don’t listen to my imaginary friend, why the fuck should I listen to yours?",
    "Joanna_1" : "Killing a man instantly robs him of explanation. He has no time to process his final moments. Now, even though he was paralyzed, his mind was still able to understand why his life was ending. We let him die with answers. Otherwise, we’re nothing but ruthless murderers.",
    "Dom_1" : "You’ve surrounded yourself with a constant reminder of mortality.",
    "Elliot_2" : "I live for this shit.",
    "Krista_1" : "Annihilation is not the way.",
    "Elliot_3" : "He’s gone. He’s gone. He’s gone.",
    "Elliot_4" : "I will not be owned",
    "Elliot_5" : "I’m late for my church group. Peace.",
    "Angela_1" : "I have value, and even though you don’t see it, they do.",
    "Darlene_3" : "We are in a war, and we are on the losing side of it. We are on our knees with guns to our heads, and they are picking us off one by one.",
    "Elliot_6" : "How do I take off a mask when it stops being a mask? When it’s as much a part of me as me?",
    "MrRobot_1" : "Could you live with yourself knowing that you framed Gideon?",
    "MrRobot_2" : "Control is an illusion.",
    "Tyrell_2" : "It’s almost as if somethings come alive.",
    "Tyrell_3" : "Why this mask? It’s a bit silly, isn’t it?",
    "MrRobot_3" : "Is any of it real? I mean, look at this. Look at it! A world built on fantasy. Synthetic emotions in the form of pills. Psychological warfare in the form of advertising. Mind-altering chemicals in the form of…food! Brainwashing seminars in the form of media. Controlled isolated bubbles in the form of social networks. Real? You want to talk about reality? We haven’t lived in anything remotely close to it since the turn of the century. We turned if off, took out the batteries, snacked on a bad of GMOs while we tossed the remnants in the ever-expanding dumpster of the human condition. We live in branded houses trademarked by corporations built on bipolar numbers jumping up and down on digital displays, hypnotizing us into the biggest slumber mankind has ever seen. You have to dig pretty deep, kiddo, before you can find anything real. We live in a  kingdom of bullshit. A kingdom you’ve lived in for far too long. So don’t tell me about not being real. I’m no less real than the fucking beef patty in your Big Mac.",
    "MrRobot_4" : "You’re losing it, kiddo. I’m only supposed to be your prophet. You’re supposed to be my God."
    ]

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
    var userAnswerEvaluated = ""
    
    
    
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
        let index: Int = Int(arc4random_uniform(UInt32(quotes.count)))
        let value = Array(quotes.values)[index]
        print("This is the value \(value)")
        let key = Array(quotes.keys)[index]
        print("This is the key \(key)")
        
        correctAnswers = key
      
        return value
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
            case "Darlene_1", "Darlene_2", "Darlene_3":
                stringAnswer = "Darlene"
                print("\(correctAnswers) is Darlene")
            case "Elliot_1", "Elliot_2", "Elliot_3", "Elliot_4", "Elliot_5", "Elliot_6":
                stringAnswer = "Elliot"
                print("\(correctAnswers) is Elliot")
            case "MrRobot_1", "MrRobot_2", "MrRobot_3", "MrRobot_4":
                stringAnswer = "Mr. Robot"
                print("\(correctAnswers) is Mr. Robot")
            case "Tyrell_1", "Tyrell_2", "Tyrell_3":
                stringAnswer = "Tyrell"
                print("\(correctAnswers) is Tyrell")
            case "Ray_1":
                stringAnswer = "Ray"
                print("\(correctAnswers) is Ray")
            case "Dom_1":
                stringAnswer = "Dom"
                print("\(correctAnswers) is Dom")
            case "Krista_1":
                stringAnswer = "Krista"
                print("\(correctAnswers) is Krista")
            case "Angela_1":
                stringAnswer = "Angela"
                print("\(correctAnswers) is Angela")
            case "Joanna_1":
                stringAnswer = "Joanna"
                print("\(correctAnswers) is Joanna")
            default:
                print("\(correctAnswers) that is not the answer")
            }
        

        comparingAnswers()
    }
    
    func comparingAnswers(){
        if usersAnswer == stringAnswer {
            self.userAnswerEvaluated = "Correct!"
            self.score += 1
            self.performSegueWithIdentifier("answerSegue", sender: nil)
            self.setupView()

            print("YOU ARE CORRECT! :)")
        } else {
            self.userAnswerEvaluated = "Wrong-o!"
            self.performSegueWithIdentifier("answerSegue", sender: nil)
            self.setupView()
            
            print("Try Again :(")
            
        }
    }
    func answerIndex() {
//        let answerIndex = quotes.indexOf(quoteLabel.text!)!
//        correctAnswers = "\(answerIndex)"
//        print(answerIndex)
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
        
        secondVC.usersAnswer = userAnswerEvaluated
        secondVC.usersScore = "Your current score is: \(score)"
    }
}
