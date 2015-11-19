//
//  main.swift
//  TypeCasting
//
//  Created by 向海涛 on 15/11/19.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation

//MARK: Defining a Class Hirarchy For Type Casting

class MediaItem {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}


class Movie: MediaItem {
    var director: String
    
    init(director: String, name: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    
    init(artist: String, name: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let libraries = [
    Movie(director: "CasaBalanc", name: "Michael Curtiz"),
    Song(artist: "Blue Suede Shoes", name: "Elvis Presley"),
    Movie(director: "Citizen", name: "Orson Welles")
]

var movieCount = 0
var songCount = 0

for item in libraries {
    if item is Movie {
        ++movieCount
    } else if item is Song {
        ++songCount
    }
}

print("libraries contains \(movieCount) movies and \(songCount) songs")

//MARK: downcasting

for item in libraries {
    if let movie = item as? Movie {
        print("\(movie.name) ++ \(movie.director)")
    } else if let song = item as? Song {
        print("\(song.name) ++ \(song.artist)")
    }
}

//MARK: Typecasting for Any and AnyObject

//Any(represent an instance of any type)
//AnyObject(represent an instance of any class type)

let someMovies: [AnyObject] = [
    Movie(director: "CasaBalanc", name: "Michael Curtiz"),
    Movie(director: "Citizen", name: "Orson Welles")
]

for object in someMovies {
    let movie = object as! Movie
    print("\(movie.name) ++ \(movie.director)")
}

for object in someMovies as! [Movie] {
    print("\(object.name) ++ \(object.director)")
}


var things = [Any]()

things.append(0)
things.append(0.0)
things.append("123")
things.append(Movie(director: "Citizen", name: "Orson Welles"))







