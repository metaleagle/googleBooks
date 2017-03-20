//
//  SearchVolumesListPresenterProtocol.swift
//  BooksAPITest
//
//  Created by Andrew Danishevskyi on 19.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

protocol SearchVolumesListPresenterProtocol: VolumesListPresenterProtocol {
    func searchFields() -> [String]?
    func requestedSearch(_ forText: String, inField field: String)
    func cancelSearchRequested()
    func displaySerchRequestActivity(_ isActive: Bool)
}
