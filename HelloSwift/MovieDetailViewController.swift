//
//  MovieDetailViewController.swift
//  HelloSwift
//
//  Created by Hugo Schouman on 12/06/2015.
//  Copyright (c) 2015 octo. All rights reserved.
//

import Foundation
import UIKit


class MovieDetailViewController : UIViewController {
    // Data
    var imdbID: String
    var movie: Movie
    
    // UI
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var pictureImageView: UIImageView!
    
    required init(coder aDecoder: NSCoder) {
        self.imdbID = ""
        self.movie = Movie(titleString: "", pictureUrlString: "", imdbIDString: "")
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieService.detailOfMovieWithId(imdbID) { (movieFromService: Movie) -> Void in
            self.movie = movieFromService
            self.configureWithMovie()
        }
    }
    
    func configureWithMovie() {
        self.titleLabel.text = self.movie.title
        self.titleLabel.hidden = false
        self.pictureImageView.image = ImageHelper.imageFromUrl(self.movie.pictureUrl)
    }
    
}