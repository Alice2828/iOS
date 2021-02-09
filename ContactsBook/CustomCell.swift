//
//  CustomCell.swift
//  ContactsBook
//
//  Created by User on 09.02.2021.
//  Copyright © 2021 User. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var contactPhone: UILabel!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
