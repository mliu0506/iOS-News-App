//
//  NewsApiManager.swift
//  News Application
//
//  Created by Sohrab Yaghoubi on 2017-11-06.
//  Copyright © 2017 cs2680. All rights reserved.
//

import Foundation

class NewsApiManager
{
	class func getNewsURL(source: String? = nil) -> URL?
	{
		let newsSource = source ?? "techcrunch"

		let urlString = "https://newsapi.org/v1/articles?source=\(newsSource)&apiKey=d6572d2119784dd985b97c0e94cfbad1"

		return URL(string: urlString)
	}

}
