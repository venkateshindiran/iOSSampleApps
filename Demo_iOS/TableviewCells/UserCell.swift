//
//  UserCell.swift
//  Demo_iOS
//
//  Created by Sarvesh on 11/08/18.
//  Copyright © 2018 venkatesh. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var tiltleLabel : UILabel!
    
    @IBOutlet weak var descLabel : UILabel!
    
    @IBOutlet weak var UserImage: UIImageView!



    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
