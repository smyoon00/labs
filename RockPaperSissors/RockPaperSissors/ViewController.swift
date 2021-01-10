//
//  ViewController.swift
//  RockPaperSissors
//
//  Created by Soomi Yoon on 2021-01-10.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    var myHand = ""
    let hands = ["👊", "🤚", "✌️"]
    let loseAgainst = ["👊":"✌️", "🤚":"👊", "✌️":"🤚"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func selectRock(_ sender: Any) {
        myHand = "👊"
        label.text = "You've select \(myHand)"
        
    }
    
    @IBAction func selectPaper(_ sender: Any) {
        myHand = "🤚"
        label.text = "You've select \(myHand)"
        
    }
    
    @IBAction func selectSissors(_ sender: Any) {
        myHand = "✌️"
        label.text = "You've select \(myHand)"
        
    }
    
    func finishGame() {
        let iPhoneHand =
            hands.randomElement()!
        
        var message = ""
        
        if iPhoneHand == myHand {
            message = "It's a 👔"
        } else if loseAgainst[iPhoneHand] == myHand {
            message = "iPhone wins"
        } else {
            message = "You won"
        }
        
        label.text = "You've selected \(myHand)\n iPhone selected \(iPhoneHand) \n \(message)"
        
    }
        
    @IBAction func play(_ sender: Any) {
        
        var counter = 3
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            timer in
            if counter > 0 {
                self.label.text = "You've selected \(self.myHand)\n\(counter)"
            }
            else {
                timer.invalidate()
                self.finishGame()
            }
            counter -= 1
        }
    }
    
}

