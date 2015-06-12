//
//  Movie.swift
//  HelloSwift
//
//  Created by Hugo Schouman on 11/06/2015.
//  Copyright (c) 2015 octo. All rights reserved.
//

import Foundation


class Movie: NSObject {
    
    var title: String
    var pictureUrl: String
    var imdbID: String

    init (titleString : String, pictureUrlString : String, imdbIDString: String) {
        self.title = titleString
        self.pictureUrl = pictureUrlString
        self.imdbID = imdbIDString
    }
    
}