//  MovieModel.swift
//  SampleProject
//  Created by Admin on 10/06/22.

import Foundation
import ObjectMapper

class MovieMainModel: Mappable {
    var movieList: [MovieListModel]?

    required init?(map: Map) {

    }

    func mapping(map: Map) {

        movieList <- map["Movie List"]
    }

}

class MovieListModel: Mappable {
    var title: String?
    var year: String?
    var summary: String?
    var shortSummary: String?
    var genres: String?
    var iMDBID: String?
    var runtime: String?
    var youTubeTrailer: String?
    var rating: String?
    var moviePoster: String?
    var director: String?
    var writers: String?
    var cast: String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {

        title           <- map["Title"]
        year            <- map["Year"]
        summary         <- map["Summary"]
        shortSummary    <- map["Short Summary"]
        genres          <- map["Genres"]
        iMDBID          <- map["IMDBID"]
        runtime         <- map["Runtime"]
        youTubeTrailer  <- map["YouTube Trailer"]
        rating          <- map["Rating"]
        moviePoster     <- map["Movie Poster"]
        director        <- map["Director"]
        writers         <- map["Writers"]
        cast            <- map["Cast"]
    }

}
