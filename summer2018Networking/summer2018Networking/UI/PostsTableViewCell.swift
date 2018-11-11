//
//  PostsTableViewCell.swift
//  summer2018Networking
//
//  Created by Vitaly Dergunov on 11/11/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    var posts: Posts? {
        didSet{
            guard let correntPost = posts else { return }
            self.bodyLabel.text = correntPost.body
            self.titleLabel.text = correntPost.title
        }
    }
    
    
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
