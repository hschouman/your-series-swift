//
//  MovieService.swift
//  HelloSwift
//
//  Created by Hugo Schouman on 11/06/2015.
//  Copyright (c) 2015 octo. All rights reserved.
//

import Foundation

// Framework
import Alamofire



class MovieService {
    
    class func fetchMovies(completionHandler: (Array<Movie>) -> Void) {
        
        var movies = Array<Movie>()
        let manager = Alamofire.Manager.sharedInstance
        
        manager.request(.GET, "http://www.myapifilms.com/imdb/top")
            .responseJSON { (_,_, JSON, _) in
                let jsonResult = JSON as! NSArray
                for jsonMovie in jsonResult {
                    var title: String = jsonMovie["title"] as! String
                    var urlsPoster: String = jsonMovie["urlPoster"] as! String
                    var imdbID: String = jsonMovie["idIMDB"] as! String
                    var movie:Movie = Movie(titleString:title, pictureUrlString:urlsPoster, imdbIDString: imdbID)
                    movies.append(movie)
                }
                completionHandler(movies)
        }
    }
    
    class func detailOfMovieWithId(imdbID: String, completionHandler: (Movie) -> Void) {
        var movie = Movie(titleString: "", pictureUrlString: "", imdbIDString: "")
        let manager = Alamofire.Manager.sharedInstance
        
        let requestUrl = "http://www.myapifilms.com/imdb?idIMDB=\(imdbID)"
        
        manager.request(.GET, requestUrl)
            .responseJSON { (_,_, JSON, _) in
                let jsonMovie = JSON as! NSDictionary
                var title: String = jsonMovie["title"] as! String
                var urlsPoster: String = jsonMovie["urlPoster"] as! String
                var imdbID: String = jsonMovie["idIMDB"] as! String
                var movie:Movie = Movie(titleString:title, pictureUrlString:urlsPoster, imdbIDString: imdbID)
                completionHandler(movie)
        }
    }
    
}