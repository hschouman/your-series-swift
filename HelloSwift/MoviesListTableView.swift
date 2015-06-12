//
//  MoviesListTableView.swift
//  HelloSwift
//
//  Created by Hugo Schouman on 11/06/2015.
//  Copyright (c) 2015 octo. All rights reserved.
//

import Foundation
import UIKit

// Frameworks
import Alamofire

class MoviesListTableView: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var movies = Array<Movie>()
    
    required init!(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieService.fetchMovies { (moviesFromService: Array<Movie>) -> Void in
            self.movies = moviesFromService
            self.tableView.reloadData()
        }
    }
    
// Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var viewController = segue.destinationViewController as! MovieDetailViewController
        
        var cell = sender as! MovieTableViewCell
        
        if let var indexPath = self.tableView.indexPathForCell(cell) as NSIndexPath? {
            var selectedMovie = self.movies[indexPath.row] as Movie
            viewController.imdbID = selectedMovie.imdbID
        }
    }
    
// TableView
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: MovieTableViewCell = tableView.dequeueReusableCellWithIdentifier("movieCell") as! MovieTableViewCell

        cell.configureWithMovie(self.movies[indexPath.row])
        
        return cell
    }    
}