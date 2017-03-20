//
//  SearchVolumesListInteractor.swift
//  BooksAPITest
//
//  Created by Andrew Danishevskyi on 19.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

class SearchVolumesListInteractor: VolumesListInteractor,  SearchVolumesListInteractorProtocol{
    var searchFields: [String: String]?
    func searchFieldTitles() -> [String]? {
        return self.searchFields?.map{$0.key}
    }
    
    var searchVolumesPresenter: SearchVolumesListPresenterProtocol?
    
    override var presenter: VolumesListPresenterProtocol?{
        get{
            return self.searchVolumesPresenter
        }
        set{
            if newValue is SearchVolumesListPresenterProtocol{
                self.searchVolumesPresenter = newValue as! SearchVolumesListPresenterProtocol?
            }
        }
    }
    
    func searchForText(_ searchText: String, inField field: String){
        self.dataStorage?.storeVolumes(nil)
        if !searchText.isEmpty{
            (self.presenter as? SearchVolumesListPresenterProtocol)?.displaySerchRequestActivity(true)
            var searchText = searchText
            if let searchField = self.searchFields?[field]{
                searchText = searchText + "+" + searchField
            }
            self.requestAPI?.set(searchText, forPathParameter: "q")
            self.requestAPI?.sendRequest(withSuccess: { response in
                (self.presenter as? SearchVolumesListPresenterProtocol)?.displaySerchRequestActivity(false)
                self.dataStorage?.storeVolumes(with: response)
            }, errorHandler: { error in
                (self.presenter as? SearchVolumesListPresenterProtocol)?.displaySerchRequestActivity(false)
                print(error)
            })
        }
    }
    
    func cancelSearch(){
        self.searchForText("", inField: "")
    }
    
}
