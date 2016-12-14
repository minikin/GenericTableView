//
//  Models.swift
//  GenericTableView
//
//  Created by Sasha Prokhorenko on 13/12/16.
//  Copyright © 2016 Sasha Prokhorenko. All rights reserved.
//

import Foundation


struct Album {
    var title: String
}

struct Artist {
    var name: String
}


let artists: [Artist] = [
    Artist(name: "Prince"),
    Artist(name: "Glen Hansard"),
    Artist(name: "I Am Oak")
]

let albums: [Album] = [
    Album(title: "Blue Lines"),
    Album(title: "Oasem"),
    Album(title: "Bon Iver")
]

enum RecentItem {
    case artist(Artist)
    case album(Album)
}

let recentItems: [RecentItem] = [
    .artist(artists[0]),
    .artist(artists[1]),
    .album(albums[0]),
    .album(albums[1])
]

extension Artist {
    func configureCell(_ cell: ArtistCell) {
        print(name)
        cell.artistLabel?.text = name
    }
}

extension Album {
    func configureCell(_ cell: AlbumCell) {
        print(title)
        cell.albumLabel?.text = title
    }
}


extension RecentItem {
    var cellDescriptor: CellDescriptor {
        switch self {
        case .artist(let artist):
            return CellDescriptor(reuseIdentifier: "artist", configure: artist.configureCell)
        case .album(let album):
            return CellDescriptor(reuseIdentifier: "album", configure: album.configureCell)
        }
    }
}
