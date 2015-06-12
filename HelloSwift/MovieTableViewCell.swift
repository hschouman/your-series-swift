//
//  MovieTableViewCell.swift
//  HelloSwift
//
//  Created by Hugo Schouman on 11/06/2015.
//  Copyright (c) 2015 octo. All rights reserved.
//

import Foundation
import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // UI
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var moviePictureImageView: UIImageView!
    
    func configureWithMovie(movie: Movie) {
        self.movieTitleLabel?.text = movie.title
        self.moviePictureImageView?.image = ImageHelper.imageFromUrl(movie.pictureUrl)
    }
    
}