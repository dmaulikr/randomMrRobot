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

    @IBOutlet weak var backgroundImage: UIImageView!
    
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
    
    private func setupView() {
        backgroundImage.image = randomImage()
//        quoteLabel.text = randomQuote()
    }
}

