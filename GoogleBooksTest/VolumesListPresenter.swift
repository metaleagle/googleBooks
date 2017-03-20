//
//  VolumesListPresenter.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 17.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//
import Foundation
import UIKit
class VolumesListPresenter: VolumesListPresenterProtocol {
    weak var view: VolumesListViewProtocol?
    var interactor: VolumesListInteractorProtocol?
    var router: VolumesListRouterProtocol?
    
    func setup(cell: VolumesListCellProtocol, forIndexPath index: IndexPath){
        cell.thumbnail.image = nil
        if let volumeItem = self.interactor?.volumeItem(index.row){
            cell.setVolumeTitle(volumeItem.title)
            cell.setVolumeAuthors(volumeItem.authors)
            if let imageURL = volumeItem.thumbURL{
                cell.thumbnail.kf.setImage(with: URL(string: imageURL))
            }
        }
    }
    
    
    
    func numberOfVolumes() -> Int{
        return self.interactor?.numberOfLoadedVolumes() ?? 0
    }
    
    func showVolumeDetails(for indexPath: IndexPath){
        if let volumeItem = self.interactor?.volumeItem(indexPath.row), nil != volumeItem.infoLink {
            self.router?.showVolumeDetailsModule(for: volumeItem, fromView: self.view as! UIViewController)
        }
    }
    
    func updateVolumesList(){
        self.view?.updateList()
    }
    
    func volumesListUpdateFailed(){
        
    }
    
    
    
    
}
