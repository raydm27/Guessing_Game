//
//  BlueViewController.swift
//  Guessing_Game
//
//  Created by Raymond D Martinusen on 3/4/18.
//  Copyright © 2018 Raymond D Martinusen. All rights reserved.
//

import UIKit

//RAYS FUNCTIONS ETC
var curQuest: Int = 1
var lastQuest: Int = 1
enum opts {
    case ask, yes, no
}

var factInts: Set<Int> = []
var binInts: Set<Int> = []
var firstInts: Set<Int> = []
var lastInts: Set<Int> = []
var factor: Int = 0



        
//END OF RAYS FUNCTIONS ETC

class BlueViewController: UIViewController {

    @IBOutlet var restart_outlet: UIView!
    
    @IBAction func restart_action(_ sender: Any) {
        print("restart")
    }
    
    @IBOutlet weak var yes_outlet: UIButton!
    
    @IBAction func yes_action(_ sender: Any) {
        print("yes")
        switch curQuest {
        case 1:
            print("binAsk")
            binAsk(choice: .yes)
        case 2:
            print("factAsk")
            factAsk(choice: .yes)
        case 3:
            print("fdAsk")
            fdAsk(choice: .yes)
        case 4:
            print("ldAsk")
            ldAsk(choice: .yes)
        case 5:
            print("hmm")
            gotIt(choice: .yes)
        default:
            print("Impossible")
        }
        if !done == true {
            askQuestion()
        }
    }
    
    @IBOutlet weak var no_outlet: UIButton!
    
    @IBAction func no_action(_ sender: Any) {
        print("no")
        switch curQuest {
        case 1:
            print("binAsk")
            binAsk(choice: .no)
        case 2:
            print("factAsk")
            factAsk(choice: .no)
        case 3:
            print("fdAsk")
            fdAsk(choice: .no)
        case 4:
            print("ldAsk")
            ldAsk(choice: .no)
        case 5:
            print("hmm")
            gotIt(choice: .no)
        default:
            print("Impossible")
        }
        if !done == true {
           askQuestion()
        }
    }
    
    @IBOutlet weak var label_outlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label_outlet.text = "hello"
        initGame()
        askQuestion()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func lastDigFix() {
        var tmp:Int = 0
        lastInts = []
        for index in possInts {
            tmp = index % 10
            lastInts.insert(tmp)
        }
        print("lastInts = \(lastInts)")
        lastDigit = lastDigit.intersection(lastInts)
    }

    func firstDigFix() {
        firstInts = []
        for index in possInts {
            switch index {
            case 1...9:
                firstInts.insert(index)
            case 10...99:
                firstInts.insert(index / 10)
            case 100...999:
                firstInts.insert(index / 100)
            case 1000...9999:
                firstInts.insert(index / 1000)
            default:
                print("no way")
            }
        }
    }
    
    func fdAsk(choice: opts) {
        var tmp: Int
        var tmpArray : [Int]

        print("in fdAsk")
        switch choice {
        case .ask:
            tmp = Int(arc4random_uniform(UInt32(firstDigit.count)))
            tmpArray = firstDigit.sorted()
            factor = tmpArray[tmp]
            label_outlet.text = "\(questionCnt): Is the first digit of your number a \(factor)?"
        case .yes:
            firstInts = []
            firstInts.insert(factor)
            for index in 0...9 {
                firstInts.insert(factor*10+index)
            }
            for index in 0...99 {
                firstInts.insert(factor*100+index)
            }
            for index in 0...999 {
                firstInts.insert(factor*1000+index)
            }
            for index in 0...9999 {
                firstInts.insert(factor*10000+index)
            }
            firstDigit = []
            print("yes:firstDigit = \(firstDigit)")
            possInts = possInts.intersection(firstInts)
            print("yes:possInts = \(possInts.sorted())")
        case .no:
            firstInts = []
            firstInts.insert(factor)
            for index in 0...9 {
                firstInts.insert(factor*10+index)
            }
            for index in 0...99 {
                firstInts.insert(factor*100+index)
            }
            for index in 0...999 {
                firstInts.insert(factor*1000+index)
            }
            for index in 0...9999 {
                firstInts.insert(factor*10000+index)
            }
            firstDigit = firstDigit.subtracting([factor])
            print("no:firstDigit = \(firstDigit)")
            possInts = possInts.subtracting(firstInts)
            print("no:possInts = \(possInts.sorted())")
        }
    }
    
    func ldAsk(choice: opts) {
        var tmp: Int
        var tmpArray : [Int]
        
        print("in ldAsk")

        switch choice {
        case .ask:
            tmp = Int(arc4random_uniform(UInt32(lastDigit.count)))
            tmpArray = lastDigit.sorted()
            factor = tmpArray[tmp]
            label_outlet.text = "\(questionCnt): Is the last digit of your number a \(factor)?"
        case .yes:
            lastInts = []
            //        lastInts.insert(factor)
            for index in 0...maxInt/10 {
                lastInts.insert(index*10+factor)
            }
            lastDigit = [factor]
            
            print("yes: lastDigit = \(lastDigit)")
            possInts = possInts.intersection(lastInts)
            firstDigFix()
            
            print("yes:possInts = \(possInts.sorted())")
            switch factor {
               case 0:
                  chkFact = chkFact.subtracting([2,5,10])
               case 1:
                  chkFact = chkFact.subtracting([2,4,5,6,8,10,12])
               case 2:
                  chkFact = chkFact.subtracting([2,5])
               case 3:
                  chkFact = chkFact.subtracting([2,4,5,6,8,10,12])
               case 4:
                  chkFact = chkFact.subtracting([2,5])
               case 5:
                  chkFact = chkFact.subtracting([2,4,5,6,8,10,12])
               case 6:
                  chkFact = chkFact.subtracting([2,5])
               case 7:
                  chkFact = chkFact.subtracting([2,4,5,6,8,10,12])
               case 8:
                  chkFact = chkFact.subtracting([2,5])
               case 9:
                    chkFact = chkFact.subtracting([2,4,5,6,8,10,12])
               default:
                  print("no way")
            }
        case .no:
            lastInts = []
            //        lastInts.insert(factor)
            for index in 0...maxInt {
                lastInts.insert(index*10+factor)
            }
            lastDigit = lastDigit.subtracting([factor])
            print("no:lastDigit = \(lastDigit)")
            possInts = possInts.subtracting(lastInts)
            print("no:possInts = \(possInts.sorted())")
            firstDigFix()
            
            switch factor {
            case 0:
                chkFact = chkFact.subtracting([10])
            case 5:
                chkFact = chkFact.subtracting([5])
            default:
                print("no way")
            }
        }
    }

    func gotIt(choice: opts) {
        print("in gotIt")
        switch choice {
        case .ask:
            for index in possInts {
                factor = index
            }
            label_outlet.text = "\(questionCnt): Is \(factor) your number?"
        case .yes:
            label_outlet.text = "Thank you for playing, please press Restart"
            done = true
        case .no:
            label_outlet.text = "I guess I messed up. Let's start again.  Please press Restart"
            done = true
        }
    }
    func binAsk(choice: opts) {
        print("in binAsk")
        var tmpArray: [Int] = []
        tmpArray = possInts.sorted()
        switch choice {
        case .ask:
            print("in binAsk, ask")
//            for index in possInts.sorted() {
//                tmpArray += [index]
//            }
            factor = (tmpArray[0] + tmpArray[tmpArray.count - 1]) / 2
            print("midpoint = \(factor)")
            label_outlet.text = "\(questionCnt): Is your number greater than \(factor)?"
            
        case .yes:
            print("in factAsk, yes")
            binInts = []
            factor += 1
            for index in factor...tmpArray[tmpArray.count - 1] {
                binInts.insert(index)
            }
            print("binInts = \(binInts)")
            possInts = possInts.intersection(binInts)
            print("possInts = \(possInts.sorted())")
            lastDigFix()
            firstDigFix()
            
            print("firstInts = \(firstInts)")
            firstDigit = firstDigit.intersection(firstInts)
            print("firstDigit = \(firstDigit)")
        case .no:
            print("in factAsk, no")
            binInts = []
            for index in tmpArray[0]...factor {
                binInts.insert(index)
            }
            print("binInts = \(binInts)")
            possInts = possInts.intersection(binInts)
            print("possInts = \(possInts.sorted())")
            lastDigFix()
            firstDigFix()
        
            print("firstInts = \(firstInts)")
            firstDigit = firstDigit.intersection(firstInts)
            print("firstDigit = \(firstDigit)")
        }
    }
    
    func factAsk(choice: opts) {
        var tmpArray: [Int] = []

        print("in factAsk")
        switch choice {
        case .ask:
            print("in factAsk, ask")
//            for index in chkFact {
//               tmpArray += [index]
//            }
            tmpArray = chkFact.sorted()
            print("tmparray = \(tmpArray)")
            factor = tmpArray[0]
            print("factor = \(factor)")
            label_outlet.text = "\(questionCnt): Is your number evenly divisible by \(factor)?"
            factInts = []
            for index in 1...maxInt {
                if index % factor == 0 {
                    factInts.insert(index)
                }
            }
            print("factInts = \(factInts)")
        case .yes:
            print("in factAsk, yes")

            possInts = possInts.intersection(factInts)
            lastDigFix()
            firstDigFix()

            switch factor {
            case 2:
                chkFact = chkFact.subtracting([2])
            case 3:
                chkFact = chkFact.subtracting([3])
            case 4:
                chkFact = chkFact.subtracting([2,4])
            case 5:
                chkFact = chkFact.subtracting([5])
            case 6:
                chkFact = chkFact.subtracting([2,3,6])
            case 7:
                chkFact = chkFact.subtracting([7])
            case 8:
                chkFact = chkFact.subtracting([2,4,8])
            case 9:
                chkFact = chkFact.subtracting([3,9])
            case 10:
                chkFact = chkFact.subtracting([2,5,10])
            case 11:
                chkFact = chkFact.subtracting([11])
            case 12:
                chkFact = chkFact.subtracting([2,3,4,6,12])
            default:
                print("Nothing needs to be done")
            }
        case .no:
            print("in factAsk, no")
            possInts = possInts.subtracting(factInts)
            
            lastDigFix()
            firstDigFix()
            
            switch factor {
            case 2:
                chkFact = chkFact.subtracting([factor,4,6,8,10,12])
            case 3:
                chkFact = chkFact.subtracting([factor,6,9,12])
            case 4:
                chkFact = chkFact.subtracting([factor,8,12])
            case 5:
                chkFact = chkFact.subtracting([factor,10])
            case 6:
                chkFact = chkFact.subtracting([factor,12])
            case 7:
                chkFact = chkFact.subtracting([factor])
            case 8:
                chkFact = chkFact.subtracting([factor])
            case 9:
                chkFact = chkFact.subtracting([factor])
            case 10:
                chkFact = chkFact.subtracting([factor])
            case 11:
                chkFact = chkFact.subtracting([factor])
            case 12:
                chkFact = chkFact.subtracting([factor])
            default:
                print("Nothing needs to be done")
            }
        }
        print("chkFact = \(chkFact)")
        print("lastInts = \(lastInts)")
        print("possInts = \(possInts.sorted())")
    }
    
    func askQuestion() {

        lastQuest = curQuest
        if possInts.count > 0 {
            print("continue")
        } else {
            print("Something went wrong, let's start again.")
            gotIt(choice: .no)
        }
        if possInts.count == 1 {
            curQuest = 5
        } else {
            curQuest = Int(arc4random_uniform(4) + 1)
        }
        print("curQuest = \(curQuest)")
        switch curQuest {
        case 1:
            if lastQuest == 1 {
                askQuestion()
            } else {
               if possInts.count > 0 {
                  print("binAsk")
                  questionCnt += 1
                  binAsk(choice: .ask)
               } else {
                   print("Something went wrong, let's start again.")
                   gotIt(choice: .no)
               }
            }
        case 2:
            print("factAsk")
            if chkFact.count > 1 && lastQuest != 2 {
                questionCnt += 1
                factAsk(choice: .ask)
            } else {
                askQuestion()
            }
        case 3:
            print("fdAsk")
            if firstDigit.count > 1 && lastQuest != 3 {
                questionCnt += 1
                fdAsk(choice: .ask)
            } else {
                askQuestion()
            }
        case 4:
            print("ldAsk")
            if lastDigit.count > 1 && lastQuest != 4 {
                questionCnt += 1
                ldAsk(choice: .ask)
            } else {
                askQuestion()
            }
        case 5:
            print("gotIt")
            questionCnt += 1
            gotIt(choice: .ask)
        default:
            print("Impossible")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
