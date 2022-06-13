//  MovieViewModel.swift
//  SampleProject
//  Created by Admin on 10/06/22.

import UIKit
import ObjectMapper

protocol MovieViewDelegate: AnyObject {
    func didFetchMovieData(responseData: Any)
    func didFailMovieData(error: NSError)
}

class MovieViewModel: TemplateMainService, AppMainServiceDelegate {
    
    /* ====================================================
     MARK: PROPERTIES
     ======================================================*/
    var mCurOperation = ""
    var movieViewDelegate: MovieViewDelegate?
    var movieDataList = [MovieListModel]()
    
    /* ====================================================
     MARK: USER DEFINE METHODS
     ======================================================*/
    func didFetchData(responseData: Any) {
        if mCurOperation == "movieList" {
            self.movieViewDelegate?.didFetchMovieData(responseData: responseData)
        }
    }
    
    func didFailWithError(error: NSError) {
        if mCurOperation == "movieList" {
            self.movieViewDelegate?.didFailMovieData(error: error)
        }
    }
    
    func getMovieDataFromServer(methodName: String, delegate: MovieViewDelegate, bodyParameter: NSDictionary) {
        self.mCurOperation = methodName
        self.movieViewDelegate = delegate
        super.mainServerdelegate = self
        super.getCallWithAlamofire(serverUrl: "https://f052e9ed-54d8-4b98-b64f-808bd17df254.mock.pstmn.io/get?data=1") // bydefault success or fail
    }
    
    /* ====================================================
     MARK : PARSE DATA  // listobject , success, message, title
     ======================================================*/
    func didParseMovieData(completion: @escaping (([MovieListModel]?) -> Void), responseData: Any) {
        let jsonData = Mapper<MovieMainModel>().map(JSONObject: responseData)
        
        if let componentListData = jsonData?.movieList {
            self.movieDataList = componentListData
        }
        completion(self.movieDataList)
    }
}
