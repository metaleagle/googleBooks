//
//  VolumeItem.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 15.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

struct VolumeItem: VolumeItemUIProtocol{
    var volumeID: String
    var title: String
    var authors: [String]?
    var thumbURL: String?
    var infoLink: String?
    init(_ withID: String, title: String, authors:[String]?, thumbURL: String?, infoLink: String?) {
        self.volumeID = withID
        self.title = title
        self.authors = authors
        self.thumbURL = thumbURL
        self.infoLink = infoLink
    }
}

extension VolumeItem{
    init?(_ withJSONDictionary: Dictionary<String, Any>){
        guard let volumeID = withJSONDictionary["id"] as? String,
            let volumeInfo = withJSONDictionary["volumeInfo"] as? Dictionary<String, Any>,
        let title = volumeInfo["title"] as? String else{
            return nil
        }
        let authors = volumeInfo["authors"] as? [String] ?? nil
        var thumbURL: String? = nil
        if let imageLinks = volumeInfo["imageLinks"] as? [String: String]{
            thumbURL = imageLinks["thumbnail"]?.replacingOccurrences(of: "http:", with: "https:")
        }
        let infoLink = withJSONDictionary["selfLink"] as? String
        self.init(volumeID, title: title, authors: authors, thumbURL: thumbURL, infoLink: infoLink)
    }
}


