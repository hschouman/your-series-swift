//
//  imageHelper.swift
//  HelloSwift
//
//  Created by Hugo Schouman on 12/06/2015.
//  Copyright (c) 2015 octo. All rights reserved.
//

import Foundation
import UIKit

class ImageHelper {
    class func imageFromUrl(urlString:String) -> UIImage {
        let url = NSURL(string: urlString)
        let data = NSData(contentsOfURL: url!)
        return UIImage(data: data!)!
    }
}