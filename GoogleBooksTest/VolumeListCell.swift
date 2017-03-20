//
//  VolumeListCell.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 15.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

import UIKit

class VolumeListCell: UITableViewCell, VolumesListCellProtocol {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    
    func setVolumeTitle(_ title: String){
        DispatchQueue.main.async {
            self.titleLabel.text = title
        }
    }
    
    func setVolumeAuthors(_ authors: [String]?){
        DispatchQueue.main.async {
            if let autorNames = authors{
                self.authorsLabel.text = autorNames.joined(separator: ", ")
            }
            else{
                self.authorsLabel.text = ""
            }
        }
    }
    
}
