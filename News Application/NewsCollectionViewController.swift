//
//  NewsCollectionViewController.swift
//  News Application
//
//  Created by Michael Liu on 2018-11-17.
//  Copyright © 2018 CS2680. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"


class NewsCollectionViewController: UICollectionViewController {
    
    var newsItems: [NewsItem]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadData()

        collectionView.refreshControl = UIRefreshControl()
        self.collectionView?.refreshControl?.addTarget(self, action: #selector(self.reloadData), for: .valueChanged)
 
    }




    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        var maxArticles = UserDefaults.standard.integer(forKey: "num_articles")
        
        if maxArticles <= 0
        {    maxArticles = 10
        }
        
        return min(self.newsItems?.count ?? 0, maxArticles)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as! NewsCollectionViewCell
        
        cell.setNewsItem(newsItem: self.newsItems![indexPath.row])
        
        return cell
    }
    
    
    @objc func reloadData()
    {
        let source = UserDefaults.standard.string(forKey: "news_source")
        
        if let url = NewsApiManager.getNewsURL(source: source)
        {
            let session = URLSession.shared
            
            let task = session.dataTask(with: url)
            { (data, response, error) in
                
                let newsData = JSON(data: data!)
                let newsJSONArray = newsData["articles"].arrayValue
                
                self.newsItems = Array<NewsItem>()
                
                for newsJSON in newsJSONArray
                {    self.newsItems?.append(NewsItem(newsJSON: newsJSON))
                }
                
                DispatchQueue.main.async
                    {    self.collectionView?.reloadData()
                        self.collectionView.refreshControl?.endRefreshing()
                }
            }
            
            task.resume()
        }
        else{
            collectionView.refreshControl?.endRefreshing()
        }
    }
   
}
