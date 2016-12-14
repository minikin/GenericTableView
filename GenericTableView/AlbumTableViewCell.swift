//
//  AlbumTableViewCell.swift
//  GenericTableView
//
//  Created by Sasha Prokhorenko on 13/12/16.
//  Copyright © 2016 Sasha Prokhorenko. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    
    @IBOutlet weak var albumLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


