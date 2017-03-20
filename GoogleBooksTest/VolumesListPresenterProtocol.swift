//
//  VolumesListPresenterProtocol.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 17.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//
import Foundation
protocol VolumesListPresenterProtocol{
    var view: VolumesListViewProtocol? { get set }
    var interactor: VolumesListInteractorProtocol? { set get }
//    View >> Presenter
    func setup(cell: VolumesListCellProtocol, forIndexPath index: IndexPath)
    func numberOfVolumes() -> Int
    func showVolumeDetails(for indexPath: IndexPath)
//    //Presenter << Interactor
    func updateVolumesList()
    func volumesListUpdateFailed()
    
}
