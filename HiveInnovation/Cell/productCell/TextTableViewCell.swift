//
//  TextTableViewCell.swift
//  HiveInnovation
//
//  Created by Aye Su Naing on 17/03/2022.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    @IBOutlet weak var textLbl: UILabel!
    
    static var identifier : String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
