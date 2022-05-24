//
//  Model.swift
//  NetworkMovies
//
//  Created by Esraa Lotfy  on 4/21/22.
//  Copyright © 2022 Esraa Lotfy . All rights reserved.
//

import Foundation
import CoreData

class MoviesItem: NSObject, Decodable{
    var itemID : String?
    var itemRank : String?
    var header :String?
    var itemImage : String?
    var weekend : String?
    var itemGross : String?
    var weeks : String?
    
    // enum must conform codingkey protcol
    enum CodingKeys: String, CodingKey{
        case itemID = "id"
        case itemRank = "rank"
        case header = "title"
        case itemImage = "image"
        case weekend = "weekend"
        case itemGross = "gross"
        case weeks = "weeks"
    }
    
    /*
     private init(id:String?, title:String?, image:String?, rank:String? , weeks:String?, weekend:String?, gross:String?) {
         //super.init()
         //super.init(entity: entity, insertInto: context)
         self.itemID = id
         self.header = title
         self.itemImage = image
         self.itemRank = rank
         self.weeks = weeks
         self.itemGross = gross
         self.weekend = weekend
         //super.init()
     }

     required public init(from decoder:Decoder) throws {
         //super.init(entity: entity,insertInto: context)
           let values = try decoder.container(keyedBy: CodingKeys.self)
           itemID = try values.decode(String.self, forKey: .itemID)
           header = try values.decode(String.self, forKey: .header)
           itemImage = try values.decode(String.self, forKey: .itemImage)
           itemRank = try values.decode(String.self, forKey: .itemRank)
           weeks = try values.decode(String.self, forKey: .weeks)
           itemGross = try values.decode(String.self, forKey: .itemGross)
           weekend = try values.decode(String.self, forKey: .weekend)
       }
     */
}

class ResponseResult: Decodable{
    var items: [MoviesItem]
    var errorMessage: String?
    
}

