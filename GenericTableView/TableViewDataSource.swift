//
//  TableViewDataSource.swift
//  GenericTableView
//
//  Created by Sasha Prokhorenko on 13/12/16.
//  Copyright © 2016 Sasha Prokhorenko. All rights reserved.
//

import UIKit

final class TableViewDataSource<Item>:NSObject, UITableViewDataSource {
    
    var items : [Item] = []
    let cellDescriptor : (Item) -> CellDescriptor
    var reuseIdentifiers: Set<String> = []
    
    init(items: [Item], cellDescriptor: @escaping (Item) -> CellDescriptor) {
        self.cellDescriptor = cellDescriptor
        super.init()
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(items.count)
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let descriptor = cellDescriptor(item)
        
        print("descriptor :", descriptor)
        
        if !reuseIdentifiers.contains(descriptor.reuseIdentifier) {
            tableView.register(descriptor.cellClass, forCellReuseIdentifier: descriptor.reuseIdentifier)
            reuseIdentifiers.insert(descriptor.reuseIdentifier)
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: descriptor.reuseIdentifier, for: indexPath)
        descriptor.configure(cell)
        
        print("CEll", cell)
        
        return cell
    }
}
