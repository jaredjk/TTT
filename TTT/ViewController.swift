//
//  ViewController.swift
//  TTT
//
//  Created by Jared K on 11/1/17.
//  Copyright © 2017 Jared K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    var game = [ //this is game board. number order as how it is set as vertical stack / horzontal stack
        [0,0,0], // tag button [00,10,20]
        [0,0,0], // tag button [01,11,21]
        [0,0,0], // tag button [02,12,22]
        ]
    var player = 1 //make player for taking turns

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        game = [
            [0,0,0],
            [0,0,0],
            [0,0,0],
        ]
        for button in buttons {
            button.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        }
        player = 1
        infoLabel.isHidden = true
//        for x in 0...2 {
//            for y in 0...2 {
//                game[x][y] = 0
//            }
        
    }
    
    func checkWinner(){
        var winner = 0
        var sum = 0
        for col in game {
            sum = col.reduce(0, +)
            if sum == 3 { winner = 1 }
            else if sum == -3 { winner = -1 }
            
        }
        for x in 0...2 {
            let a = game[0][x]
            let b = game[1][x]
            let c = game[2][x]
            sum = a + b + c
            print(sum)
            if sum == 3 { winner = 1 }
            else if sum == -3 { winner = -1 }
        }

        sum = game[0][0] + game[1][1] + game[2][2]
        if sum == 3 { winner = 1 }
        else if sum == -3 { winner = -1 }
        sum = game[2][0] + game[1][1] + game[0][2]
        if sum == 3 { winner = 1 }
        else if sum == -3 { winner = -1 }
        
        if winner == 1 {
            infoLabel.text = "Blue Won!"
            infoLabel.isHidden = false
        } else if winner == -1 {
            infoLabel.text = "Red Won!"
            infoLabel.isHidden = false
        }
        if winner != 0 {
            game = [
                [1,1,1],
                [1,1,1],
                [1,1,1],
            ]
        }
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        var tagstr = String(format: "%02d", sender.tag)
        let x = Int(String(Array(tagstr.characters)[0]))!
        let y = Int(String(Array(tagstr.characters)[1]))!
//        print (x,y)

        if game[x][y] == 0 {
            game[x][y] = player
            var color:UIColor
            if player == 1 {color = #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)}//color for each player
            else{color = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)}
            sender.backgroundColor = color
            
            checkWinner()
            if player == 1 { player = -1}
            else { player = 1 }
        }
        

        
    }
}






























