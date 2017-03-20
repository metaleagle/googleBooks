//
//  VolumesListView.swift

//
//  Created by Андрей Данишевский on 17.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//
import UIKit

class VolumesListViewController: UITableViewController, VolumesListViewProtocol{
    var presenter: VolumesListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib.init(nibName: VolumeListCell.reuseID(), bundle: nil), forCellReuseIdentifier: VolumeListCell.reuseID())
        self.tableView.tableFooterView = UIView()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfVolumes() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VolumeListCell.reuseID(), for: indexPath) as! VolumeListCell
        self.presenter?.setup(cell: cell, forIndexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.presenter?.showVolumeDetails(for: indexPath)
    }
    
    func updateList(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
}
