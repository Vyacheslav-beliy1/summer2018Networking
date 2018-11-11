//
//  UserTableViewCell.swift
//  summer2018Networking
//
//  Created by Vitaly Dergunov on 11/10/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    var users: User? {
        didSet {
            guard let currentUser = users else {return}
            self.nameLabel.text = currentUser.name
            self.userNameLabel.text = currentUser.username
            self.phoneLabel.text = currentUser.phone
            self.emailLabel.text = currentUser.email
            self.website.text = currentUser.website
            
        }
    }

        @IBOutlet weak var emailLabel: UILabel!
        @IBOutlet weak var phoneLabel: UILabel!
        @IBOutlet weak var userNameLabel: UILabel!
        @IBOutlet weak var nameLabel: UILabel!
        @IBOutlet weak var website: UILabel!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
