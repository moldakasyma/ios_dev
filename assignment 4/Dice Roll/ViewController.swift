//
//  ViewController.swift
//  Dice Roll
//
//  Created by  Айя on 14.10.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var leftDice: UIImageView!
    @IBOutlet weak var rightDice: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    

    let diceImage: [UIImage]=[#imageLiteral(resourceName: "DiceOne") , #imageLiteral(resourceName: "DiceTwo") , #imageLiteral(resourceName: "DiceThree") , #imageLiteral(resourceName: "DiceFour") , #imageLiteral(resourceName: "DiceFive") , #imageLiteral(resourceName: "DiceSix")]
    let diceEnum: [UIImage]=[.diceOne, .diceTwo, .diceThree, .diceFour , .diceFive, .diceSix]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftDice.image = .diceOne
        rightDice.image = .diceFour
        rollButton.layer.cornerRadius=18
        rollButton.backgroundColor = .brown
        
    }
    @IBAction func rollButton(_ sender: UIButton) {
        let randomOrder=Int.random(in: 0..<diceImage.count)
        leftDice.image=diceImage[randomOrder]
        rightDice.image=diceEnum.randomElement()
    }

    
}

