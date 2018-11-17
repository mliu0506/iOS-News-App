//
//  Extension.swift
//  News Application
//
//  Created by Michael Liu on 2018-11-17.
//  Copyright © 2018 CS2680. All rights reserved.
//

import Foundation

import UIKit

extension UIImageView
{
    func loadImage(url: URL?)
    {
        self.image = nil
        
        if url != nil
        {
            let task = URLSession.shared.dataTask(with: url!)
            { (data, response, error) in
                
                DispatchQueue.main.async
                    {
                        if data != nil && error == nil
                        {
                            if let image = UIImage(data: data!)
                            {    self.image = image
                            }
                        }
                }
            }
            
            task.resume()
        }
    }
}
