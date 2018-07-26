//
//  ViewController.swift
//  Guessing_Game
//
//  Created by Raymond D Martinusen on 3/4/18.
//  Copyright © 2018 Raymond D Martinusen. All rights reserved.
//

import UIKit

var possInts: Set<Int> = []
var firstDigit: Set<Int> = []
var lastDigit: Set<Int> = []
var chkFact: Set<Int> = []
var done = false
let maxInt = 1000
var questionCnt = 0

func initGame() {
    done = false
    questionCnt = 0
    for index in 1...maxInt {
        possInts.insert(index)
    }
    print("possInts = \(possInts)")
    for index in 0...9 {
        lastDigit.insert(index)
    }
    print("lastDigit = \(lastDigit)")
    for index in 1...9 {
        firstDigit.insert(index)
    }
    print("firstDigit = \(firstDigit)")
    for index in 2...12 {
        chkFact.insert(index)
    }
    print("chkFact = \(chkFact)")
}

class RedViewController: UIViewController {

    @IBOutlet weak var start_outlet: UIButton!
    
    @IBAction func start_action(_ sender: Any) {
        print("hello")
    }
    @IBOutlet weak var redLabelOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        redLabelOutlet.text = "Think of a number between 1 and \(maxInt) inclusive. I am going to ask a series of yes/no questions.  The final one will be my guess."
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

