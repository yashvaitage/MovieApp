//  LoginScreenView.swift
//  SampleProject
//  Created by Admin on 19/04/22.

import UIKit
import IQKeyboardManager
import AudioToolbox

class MovieScreenView: AppMainVc, MovieViewDelegate {
    
    /* ====================================================
     MARK: OUTLETS
     ======================================================*/
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headingLbl: UILabel!
    @IBOutlet weak var backImg: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var headerView: UIView!
    /* ====================================================
     MARK: PROPERTIES
     ======================================================*/
    var pullControl = UIRefreshControl()
    var limit = 10
    var index = 0
    var recordsArray:[Int] = Array()
    
    lazy var movieViewModel = MovieViewModel() // object of notification view model
    
    var movieListData: [MovieListModel]? {
        didSet {
                    self.tableView.reloadData()
        }
    }
    /* ====================================================
     MARK: VIEW LIFE CYCLE METHODS
     ======================================================*/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.tableFooterView = UIView(frame: .zero)
        
        while index < limit {
            recordsArray.append(index)
            index += 1
        }
        
        /* Pull To Refresh */
        pullControl.attributedTitle = NSAttributedString(string: "Pull To Refresh")
        
        pullControl.addTarget(self, action: #selector(refreshListData(_:)), for: .valueChanged)
        
        self.tableView.refreshControl = pullControl

        doInit()
    }
    
    /* ====================================================
     MARK: USER DEFINE METHODS
     ======================================================*/
    
    func doInit() {
        getMovieData()
        markupUI()
      
    }
    
    @objc func refreshListData(_ sender: Any) {
        self.pullControl.endRefreshing()
        MovieViewModel() // API Call Here
    }
    
    func didFetchMovieData(responseData: Any) {
        // go/redirect/navigate to parsing method (available at :- view model)
        self.movieViewModel.didParseMovieData(completion: { (listData) in
                self.movieListData = listData
            
        }, responseData: responseData)
    }
    
    func didFailMovieData(error: NSError) {
        print(error.localizedDescription)
    }
    
    func getMovieData() {
        let dict: NSDictionary = [:]
        
        self.movieViewModel.getMovieDataFromServer(methodName: "movieList", delegate: self, bodyParameter: dict)
    }
    
    func markupUI() {
        headerView.layer.backgroundColor = "#851008".colorWithHexString(hex: "#851008").cgColor
        
        backImg.setUpImageData(imageName: "backBtn",
                               isSelected: true)
        
        headingLbl.setCustomText(text: "Movies",
                                 font: FontType.LatoBold,
                                 size: "20",
                                 color: ColorCode.white,
                                 style: nil)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

/* ====================================================
 MARK: TABLE VIEW METHODS
 ======================================================*/

extension MovieScreenView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recordsArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "movieTableCell", for: indexPath) as? MovieTableCell {
//            if cell == nil {
//                cell = UITableViewCell(style: .default, reuseIdentifier: "movieTableCell") as? MovieTableCell
//            }
            
            cell.dataList = self.movieListData?[indexPath.row]
            cell.selectionStyle = .none
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == recordsArray.count - 1 {
            if recordsArray.count < movieListData?.count ?? 0 {
                var index = recordsArray.count
                limit = (movieListData?.count ?? 0)
                while index < limit {
                    recordsArray.append(index)
                    index += 1
                }
                self.perform(#selector(loadTable), with: nil, afterDelay: 3.0)
            }
        }
    }
    
    @objc func loadTable() {
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
}
