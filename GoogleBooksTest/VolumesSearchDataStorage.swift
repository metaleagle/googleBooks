//
//  VolumesSearchDataStorage.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 17.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//
import Foundation

class VolumesSearchDataStorage: VolumesDataStorageProtocol{
    var interactor: VolumesListInteractorProtocol?
    var volumes: [VolumeItemUIProtocol]?{
        didSet{
            self.interactor?.volumesListUpdated()
        }
    }
    
    func volumeItem(at index: Int) ->VolumeItemUIProtocol?{
        if let savedVolumes = self.volumes,
            index >= 0 && index < savedVolumes.count{
            return savedVolumes[index]
        }
        return nil
    }
    
    func storeVolumes(_ volumes: [VolumeItemUIProtocol]?){
        self.volumes = volumes
    }
    
    func storeVolumes(with response: ResponseProtocol){
        DispatchQueue.global(qos: .userInitiated).async {
            guard let JSONDictionary = response.JSONBody(),
                let items = JSONDictionary["items"] as? [Dictionary<String, AnyObject>] else {
                    self.interactor?.volumesListUpdateFailed()
                    return
            }
            self.volumes =  items.map({ itemDictionary in
                VolumeItem(itemDictionary)!
            })
        }
    }
}
