//
//  VolumesListViewProtocol.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 17.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

protocol VolumesListViewProtocol: class{
    func updateList()
}

protocol SearchVolumesListViewProtocol: VolumesListViewProtocol{
    func showSearchNetworkActivity(_ active: Bool)
}
