//
//  ModalViewController.swift
//  randomMrRobot
//
//  Created by Paige Walters on 8/2/16.
//  Copyright © 2016 Paige Walters. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    
    @IBOutlet weak var usersAnswerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    var usersAnswer: String = ""
    var usersScore: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        usersAnswerLabel.text = usersAnswer
        scoreLabel.text = usersScore
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
