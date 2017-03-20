//
//  VolumeDetailsRouterProtocol.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 16.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

import UIKit

protocol VolumeDetailsRouterProtocol: class{
    static func volumeDetailsModule(with volumeItem: VolumeItemUIProtocol) -> UIViewController
    func dismissVolumeDetailsInterface(from view:VolumeDetailsViewProtocol, completion: (() -> Void)?)
}
