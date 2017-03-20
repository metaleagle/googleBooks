//
//  VolumesDataStorageProtocol.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 17.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

protocol VolumesDataStorageProtocol{
    var interactor: VolumesListInteractorProtocol? { set get }
    var volumes: [VolumeItemUIProtocol]? { get }
    func volumeItem(at index: Int) ->VolumeItemUIProtocol?
    func storeVolumes(_ volumes: [VolumeItemUIProtocol]?)
    func storeVolumes(with response: ResponseProtocol)
}
