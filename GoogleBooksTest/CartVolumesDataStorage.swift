//
//  CartVolumesDataStorage.swift
//  BooksAPITest
//
//  Created by Andrew Danishevskyi on 19.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//
import CoreData
import UIKit
class CartVolumesDataStorage:NSObject, VolumesDataStorageProtocol, NSFetchedResultsControllerDelegate{
    var interactor: VolumesListInteractorProtocol?
    var volumes: [VolumeItemUIProtocol]?{
        get{
            if let fetched = self.fetchedResultController.fetchedObjects{
                return fetched.map{VolumeItem($0.volumeID!, title: $0.title!, authors: $0.authors, thumbURL: $0.thumbURL, infoLink: $0.infoLink)}
            }
            return nil
        }
    }
    lazy var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func volumeItem(at index: Int) ->VolumeItemUIProtocol?{
        if let savedVolumes = self.volumes,
            index >= 0 && index < savedVolumes.count{
            
            return savedVolumes[index]
        }
        return nil
    }
    
    func storeVolumes(_ volumes: [VolumeItemUIProtocol]?){

    }
    
    func storeVolumes(with response: ResponseProtocol){
    }
    
    lazy var fetchedResultController: NSFetchedResultsController<Volume> = {[unowned self] in
        let request = Volume.createFetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "volumeID", ascending: true)]
        let frc =  NSFetchedResultsController(fetchRequest: request , managedObjectContext: self.context, sectionNameKeyPath: nil, cacheName: nil)
        frc.delegate = self
        do {
            try frc.performFetch()
        } catch {
            let fetchError = error as NSError
            print("Unable to perform fetch \n \(fetchError), \(fetchError.localizedDescription)")
        }
        return frc
        }()
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        self.interactor?.volumesListUpdated()
    }
    
}
