//
//  ViewController.swift
//  RandomizerApp
//
//  Created by  Айя on 21.10.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    let favImage: [UIImage] = [#imageLiteral(resourceName: "Flowers") , #imageLiteral(resourceName: "Landmark"), #imageLiteral(resourceName: "Bigban"), #imageLiteral(resourceName: "Cinema"), #imageLiteral(resourceName: "Kitty"), #imageLiteral(resourceName: "Cosmetics"), #imageLiteral(resourceName: "Strawberries"), #imageLiteral(resourceName: "Mountains") , #imageLiteral(resourceName: "Art"), #imageLiteral(resourceName: "Books")]
    let titles: [String]=["Hydrangeas", "Sunsets", "Big Ben", "Cinema", "Kitty", "Cosmetics", "Strawberries", "Mountains", "Art", "Books"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image=favImage[0]
        label.text=titles[0]
        button.layer.cornerRadius=18
    
     
    }

    @IBAction func randomImage(_ sender: Any) {
        let randomOrder=Int.random(in: 0..<favImage.count)
        image.image=favImage[randomOrder]
        label.text=titles[randomOrder]
        
        
    }
    
}

