//
//  VolumeDetailsLocalStorage.swift
//  BooksAPITest
//
//  Created by Andrew Danishevskyi on 19.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//
import CoreData
import UIKit

class VolumeDetailsLocalStorage: NSObject, VolumeDetailsLocalStorageProtocol, NSFetchedResultsControllerDelegate{
    let volumeID: String
    var volumeUpdatedAction: (() -> ())?
    
    init(volumeID: String){
        self.volumeID = volumeID
        super.init()
    }
    
    lazy var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func isVolumeInCart() -> Bool{
        return nil != self.getLocalStoredVolume()
    }
    
    func addVolumeToCart(volumeToBeAdded:VolumeDetailsUIProtocol) {
        if !self.isVolumeInCart(){
            let volume = NSEntityDescription.insertNewObject(forEntityName: "Volume", into: self.context) as! Volume
            volume.volumeID = volumeToBeAdded.volumeID
            volume.title = volumeToBeAdded.title
            volume.authors = volumeToBeAdded.authors
            volume.volumeDescription = volumeToBeAdded.description
            volume.thumbURL = volumeToBeAdded.coverImageURL
            volume.infoLink = volumeToBeAdded.selfLink
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
    }
    
    func removeVolumeFromCart() {
        guard let storedVolume = self.getLocalStoredVolume() else {
            return
        }
        self.context.delete(storedVolume)
    }
    
    func getLocalStoredVolume() -> Volume?{
        let storedVolumes = self.fetchedResultController.fetchedObjects
        let storedVolume = storedVolumes?.first
        return storedVolume
    }
    
    lazy var fetchedResultController: NSFetchedResultsController<Volume> = {[unowned self] in
        let request = Volume.createFetchRequest()
        request.predicate = NSPredicate(format: "volumeID == %@", self.volumeID)
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
        if nil != self.volumeUpdatedAction{
            self.volumeUpdatedAction!()
        }
    }

}
