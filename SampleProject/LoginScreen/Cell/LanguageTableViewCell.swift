//  LanguageTableViewCell.swift
//  SampleProject
//  Created by Admin on 19/04/22.

import UIKit

class LanguageTableViewCell: UITableViewCell {
    @IBOutlet weak var langLbl: UILabel!
    @IBOutlet weak var radioBtnImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
