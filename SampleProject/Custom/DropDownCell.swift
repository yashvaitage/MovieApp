//
//  DropDownCell.swift
//  SampleProject
//
//  Created by apple on 15/04/22.
//

import Foundation
import UIKit

class DropDownCell: UITableViewCell {

    @IBOutlet weak var lblItem: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
