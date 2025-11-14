//
//  MediaTableViewCell.swift
//  TableView
//
//  Created by  Айя on 14.11.2025.
//

import UIKit

class MediaTableViewCell: UITableViewCell {


    @IBOutlet weak var imageContainer: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
 
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var reviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with item: MediaItem){
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
            titleLabel.attributedText = makeBoldPrefix(prefix: "Title: ", content: item.title)
            subtitleLabel.attributedText = makeBoldPrefix(prefix: "Subtitle: ", content: item.subtitle)
            reviewLabel.attributedText = makeBoldPrefix(prefix: "Review: ", content: item.review)
            imageContainer.image=item.image
            
            titleLabel.numberOfLines = 0
            subtitleLabel.numberOfLines = 0
            reviewLabel.numberOfLines = 0

        }

    }



