//
//  VolumesListRouterProtocol.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 17.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//
import UIKit
protocol VolumesListRouterProtocol{
    static func listVolumesModule() -> UIViewController
    func showVolumeDetailsModule(for volume: VolumeItemUIProtocol, fromView: UIViewController)
}
