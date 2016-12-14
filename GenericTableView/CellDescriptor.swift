//
//  CellDescriptor.swift
//  GenericTableView
//
//  Created by Sasha Prokhorenko on 13/12/16.
//  Copyright © 2016 Sasha Prokhorenko. All rights reserved.
//

import UIKit

struct CellDescriptor {
    let cellClass: UITableViewCell.Type
    let reuseIdentifier: String
    let configure: (UITableViewCell) -> ()
    
    init<Cell: UITableViewCell>(reuseIdentifier:String, configure: @escaping (Cell) -> ()) {
        self.cellClass = Cell.self
        self.reuseIdentifier = reuseIdentifier
        self.configure = { cell in
            configure(cell as! Cell)
        }
    }
}
