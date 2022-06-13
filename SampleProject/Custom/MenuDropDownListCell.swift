//
//  MenuDropDownListCell.swift
//  SampleProject
//
//  Created by apple on 15/04/22.
//

import UIKit

class MenuDropDownListCell: UITableViewCell {

    @IBOutlet weak var lblItem: UILabel!
    @IBOutlet weak var lblLineDivider: UILabel!
    @IBOutlet weak var lblLineHeightConstraints: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
