//
//  DetailViewController.swift
//  Navigation
//
//  Created by  Айя on 18.11.2025.
//

import UIKit

class DetailViewController: UIViewController {
    var item: MediaItem?
    
 
   
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemSubtitleLabel: UILabel!
      @IBOutlet weak var itemReviewLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let item=item{
            func makeBoldPrefix(prefix: String, content: String, fontSize: CGFloat = 16) -> NSAttributedString {
                    let boldAttributes: [NSAttributedString.Key: Any] = [
                        .font: UIFont.boldSystemFont(ofSize: fontSize)
                    ]
                    let normalAttributes: [NSAttributedString.Key: Any] = [
                        .font: UIFont.systemFont(ofSize: fontSize)
                    ]
                    
                    let result = NSMutableAttributedString(string: prefix, attributes: boldAttributes)
                    result.append(NSAttributedString(string: content, attributes: normalAttributes))
                    return result
            }
            itemImageView.image=item.image
            itemTitleLabel.text=item.title
            itemSubtitleLabel.text=item.description
            itemReviewLabel.attributedText = makeBoldPrefix(prefix: "Review: ", content: item.review)
        }
    }
    
    

}
