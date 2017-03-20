//
//  SearchVolumesListPresenter.swift
//  BooksAPITest
//
//  Created by Andrew Danishevskyi on 19.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

class SearchVolumesListPresenter:VolumesListPresenter, SearchVolumesListPresenterProtocol{
    var searchVolumesListInteractor: SearchVolumesListInteractorProtocol?
    override var interactor: VolumesListInteractorProtocol?{
        get{
            return self.searchVolumesListInteractor
        }
        set{
            if newValue is SearchVolumesListInteractorProtocol{
                self.searchVolumesListInteractor = newValue as! SearchVolumesListInteractorProtocol?
            }
        }
    }
    
    var searchVolumesview: SearchVolumesListViewProtocol?
    
    override var view: VolumesListViewProtocol?{
        get {
            return self.searchVolumesview
        }
        set {
            if newValue is SearchVolumesListViewProtocol{
                self.searchVolumesview = newValue as! SearchVolumesListViewProtocol?
            }
        }
    }
    
    func searchFields() -> [String]? {
        return (self.interactor as? SearchVolumesListInteractorProtocol)?.searchFieldTitles()
    }
    
    func requestedSearch(_ forText: String, inField field: String){
        (self.interactor as? SearchVolumesListInteractorProtocol)?.searchForText(forText, inField: field)
    }
    
    func cancelSearchRequested(){
        (self.interactor as? SearchVolumesListInteractorProtocol)?.cancelSearch()
    }
    
    func displaySerchRequestActivity(_ isActive: Bool){
        (self.view as? SearchVolumesListViewProtocol)?.showSearchNetworkActivity(isActive)
    }
}
