//
//  VolumeItemDetails.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 16.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

struct VolumeItemDetails: VolumeDetailsUIProtocol{
    var volumeID: String
    var title: String
    var authors: [String]?
    var description: String?
    var coverImageURL: String?
    var selfLink: String?
    
    init(with volumeID: String, title: String, authors: [String]?, description: String?, coverImageURL: String?, selfLink: String?){
        self.volumeID = volumeID
        self.title = title
        self.authors = authors
        self.description = description
        self.coverImageURL = coverImageURL
        self.selfLink = selfLink
    }
}

extension VolumeItemDetails{
    init?(_ withJSONDictionary: Dictionary<String, Any>){
        guard let volumeID = withJSONDictionary["id"] as? String,
            let volumeInfo = withJSONDictionary["volumeInfo"] as? Dictionary<String, Any>,
            let title = volumeInfo["title"] as? String else{
                return nil
        }
        let selfLink = withJSONDictionary["selfLink"] as? String
        let authors = volumeInfo["authors"] as? [String] ?? nil
        var thumbURL: String? = nil
        if let imageLinks = volumeInfo["imageLinks"] as? [String: String]{
            thumbURL = imageLinks["small"]?.replacingOccurrences(of: "http:", with: "https:")
        }
        let description = volumeInfo["description"] as? String
        self.init(with: volumeID, title: title, authors: authors, description: description, coverImageURL: thumbURL, selfLink: selfLink)
    }
}
