//  MovieTableCell.swift
//  SampleProject
//  Created by Admin on 10/06/22.
import UIKit

class MovieTableCell: UITableViewCell {
    /* ====================================================
     MARK: OUTLETS
     ======================================================*/
    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var movieTitleLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var runtimelbl: UILabel!
    @IBOutlet weak var castLbl: UILabel!
    @IBOutlet weak var directedByLbl: UILabel!
    @IBOutlet weak var writerLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var starBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    var dataList: MovieListModel? {
        didSet {
            if dataList != nil {
                
//                self.moviePosterImage.sd_setImage(with: URL(string: (dataList?.moviePoster)!), completed: nil)
                
                if let image = dataList?.moviePoster {
                    if image == " " {
                        self.imageHeightConstraint.constant = 0
                    } else {
                        self.imageHeightConstraint.constant = 228
                        self.moviePosterImage.sd_setImage(with: URL(string: image), completed: nil)
                    }
                    
                } else {
                    self.imageHeightConstraint.constant = 0
                }
                
                self.movieTitleLbl.setCustomText(text: dataList?.title,
                                              font: FontType.LatoRegular,
                                              size: FontSize.sixteen,
                                              color: ColorCode.black,
                                              style: nil)
                                             
                                             self.runtimelbl.setCustomText(text: "Runtime :" + ((self.dataList?.runtime))!,
                                                    font: FontType.LatoRegular,
                                                    size: FontSize.ten,
                                                    color: ColorCode.gray,
                                                    style: nil)
                
                self.yearLbl.setCustomText(text: dataList?.year,
                                                    font: FontType.LatoRegular,
                                                    size: FontSize.ten,
                                                    color: ColorCode.gray,
                                                    style: nil)
                
                self.castLbl.setCustomText(text: dataList?.cast,
                                             font: FontType.LatoRegular,
                                             size: FontSize.fourteen,
                                             color: ColorCode.black,
                                             style: nil)
                
                self.directedByLbl.setCustomText(text: "Directed by :" + ((dataList?.director))!,
                                             font: FontType.LatoRegular,
                                             size: FontSize.fourteen,
                                             color: ColorCode.black,
                                             style: nil)
                
                self.writerLbl.setCustomText(text: "Writer :" + ((dataList?.writers))!,
                                             font: FontType.LatoRegular,
                                             size: FontSize.fourteen,
                                             color: ColorCode.black,
                                             style: nil)
                
                self.ratingLbl.setCustomText(text: dataList?.rating,
                                             font: FontType.LatoRegular,
                                             size: FontSize.ten,
                                             color: ColorCode.gray,
                                             style: nil)
                
                self.starImage.setUpImageData(imageName: "rate", isSelected: true)
            }
        }
    }
}
