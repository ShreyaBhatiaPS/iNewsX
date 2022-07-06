//
//  NewsCollectionViewCell.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 04/07/22.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var publishedDate: UILabel!
    @IBOutlet weak var newsdesc: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var newsData: NewsData? {
        didSet {
            title.text = newsData?.title
            publishedDate.text = newsData?.publishedDate
            newsdesc.text = newsData?.description
            imageView.downloadImage(from: newsData?.imageUrl ?? "")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addShadoweffect()
    }
        
}
