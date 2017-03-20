//
//  SearchVolumesListInteractorProtocol.swift
//  BooksAPITest
//
//  Created by Andrew Danishevskyi on 19.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

protocol SearchVolumesListInteractorProtocol: VolumesListInteractorProtocol {
    func searchFieldTitles() -> [String]?
    func searchForText(_ searchText: String, inField field: String)
    func cancelSearch()
}
