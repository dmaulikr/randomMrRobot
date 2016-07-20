//
//  ViewController.swift
//  randomMrRobot
//
//  Created by Paige Walters on 7/19/16.
//  Copyright © 2016 Paige Walters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let images = [ "mrrobot_1", "mrrobot_2", "mrrobot_3", "mrrobot_4", "mrrobot_5", "mrrobot_6", "mrrobot_7", "mrrobot_8", "mrrobot_9", "mrrobot_10", "mrrobot_11", "mrrobot_12", "mrrobot_13", "mrrobot_14", "mrrobot_15", "mrrobot_16", "mrrobot_17", "mrrobot_18", "mrrobot_19", "mrrobot_20", "mrrobot_21", "mrrobot_22", "mrrobot_23", "mrrobot_24", "mrrobot_25", "mrrobot_26", "mrrobot_27", "mrrobot_28", "mrrobot_29", "mrrobot_30", "mrrobot_31", "mrrobot_32", "mrrobot_33"
    ]
    
    let quotes = ["We are in a war, and we are on the losing side of it.\nWe are on our knees with guns to our heads, and they are picking us off one by one.\n-Darlene", "How do I take off a mask when it stops being a mask?\nWhen it's as much a part of me as me?\n-Elliot", "Control is an illusion.", "Why this mask?\nIt's a bit silly, isn't it?\n-Tyrell", "In that moment, it's just you and absolute power.\nNothing else. That moment stayed with me.\nI thought I'd feel guilty for being a murderer but... I don't.\nI feel wonder.\n-Tyrell", "Corporate greed is a trickle down desire\nthat reaches even the bottom of the food chain.\n-Darlene"]

    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func randomBtn(sender: AnyObject) {
        setupView()
    
    }
    
    func randomImage() -> UIImage {
        let idx = Int(arc4random_uniform(UInt32(images.count)))
        guard let image = UIImage(named: images[idx]) else { fatalError() }
        
        return image
    }
   func randomQuote() -> String {
        let idx = Int(arc4random_uniform(UInt32(quotes.count)))
        return quotes[idx]
    }
    
    func setupView() {
        backgroundImage.image = randomImage()
        quoteLabel.text = randomQuote()
    }
}

