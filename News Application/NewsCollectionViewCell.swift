//
//  NewsCollectionViewCell.swift
//  News Application
//
//  Created by Michael Liu on 2018-11-17.
//  Copyright © 2018 CS2680. All rights reserved.
//

import UIKit



class NewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    func setNewsItem(newsItem: NewsItem)
    {
        self.imageView.loadImage(url: newsItem.imageURL)
        
        self.headlineLabel.text = newsItem.title
        self.descriptionLabel.text = newsItem.description
        self.authorLabel.text = newsItem.author
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        dateFormatter.dateStyle = .medium
        self.dateLabel.text = dateFormatter.string(from: newsItem.publishDate)
    }
    
}




