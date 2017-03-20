//
//  SearchVolumesListView.swift

//
//  Created by Андрей Данишевский on 14.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

import UIKit

class SearchVolumesListViewController: VolumesListViewController, SearchVolumesListViewProtocol, UISearchResultsUpdating, UISearchBarDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    var searchBarActivityIndicator: UIActivityIndicatorView?
    var seacrhPresenter: SearchVolumesListPresenterProtocol?
    override var presenter: VolumesListPresenterProtocol?{
        get {
            return self.seacrhPresenter
        }
        set{
            if newValue is SearchVolumesListPresenterProtocol{
                seacrhPresenter = newValue as! SearchVolumesListPresenterProtocol?
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupSearchBar()
    }

    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scopeButtonTitles = searchBar.scopeButtonTitles!
        let scope = scopeButtonTitles[searchBar.selectedScopeButtonIndex]
        (self.presenter as? SearchVolumesListPresenterProtocol)?.requestedSearch(searchController.searchBar.text!, inField: scope)
    }

    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        self.updateSearchResults(for: searchController)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        (self.presenter as? SearchVolumesListPresenterProtocol)?.cancelSearchRequested()
    }
    
    func setupSearchBar(){
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        searchController.searchBar.scopeButtonTitles = (self.presenter as? SearchVolumesListPresenterProtocol)?.searchFields()
        searchController.searchBar.delegate = self
        searchController.searchBar.returnKeyType = .done
        searchController.searchBar.placeholder = "Search in Google Books"
        
        self.searchBarActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        if !self.searchController.searchBar.addActivityIndicatorView(self.searchBarActivityIndicator!){
            self.searchBarActivityIndicator = nil
        }
    }

    func showSearchNetworkActivity(_ active: Bool){
        DispatchQueue.main.async {
            self.searchBarActivityIndicator?.isHidden = !active
            if active{
                self.searchBarActivityIndicator?.startAnimating()
            }
            else {
                self.searchBarActivityIndicator?.stopAnimating()
            }
        }
    }
}



