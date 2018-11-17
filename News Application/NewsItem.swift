//
//  NewsItem.swift
//  News Application
//
//  Created by Sohrab Yaghoubi on 2017-11-06.
//  Copyright © 2017 cs2680. All rights reserved.
//

import Foundation

class NewsItem
{
	let author: String
	let title: String
	let description: String
	let url: URL?
	let imageURL: URL?
	let publishDate: Date

	init(newsJSON: JSON)
	{
		self.author = newsJSON["author"].stringValue
		self.title = newsJSON["title"].stringValue
		self.description = newsJSON["description"].stringValue

		url = newsJSON["url"].url
		imageURL = newsJSON["urlToImage"].url

		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"

		publishDate = dateFormatter.date(from: newsJSON["publishedAt"].stringValue) ?? Date()
	}
}
