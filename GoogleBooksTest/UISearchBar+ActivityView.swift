//
//  UISearchBar+ActivityView.swift
//  BooksAPITest
//
//  Created by Андрей Данишевский on 16.03.17.
//  Copyright © 2017 MetalEaglE. All rights reserved.
//

import UIKit

extension UISearchBar{
    func addActivityIndicatorView(_ activityIndicator: UIActivityIndicatorView) -> Bool {
        if let textField = self.getTextFieldFromSuperview(self){
            if let leftView = textField.leftView{
                activityIndicator.frame = leftView.bounds
                leftView.addSubview(activityIndicator)
                return true
            }
        }
        return false
    }
    
    func getTextFieldFromSuperview(_ containingView: UIView) -> UITextField?{
        for eachSubview in containingView.subviews{
            if eachSubview is UITextField{
                return (eachSubview as! UITextField)
            }
            else if !eachSubview.subviews.isEmpty{
                if let textField = self.getTextFieldFromSuperview(eachSubview){
                    return textField
                }
            }
        }
        return nil
    }
}
