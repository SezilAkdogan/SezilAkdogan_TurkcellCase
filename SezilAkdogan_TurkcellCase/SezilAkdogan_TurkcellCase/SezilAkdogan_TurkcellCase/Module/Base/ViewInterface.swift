//
//  ViewInterface.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 12.07.2023.
//

import UIKit

protocol ViewInterface: AnyObject {
    func showLoading()
    func hideLoading()
    func showAlert(_ title: String, _ message: String)
}

extension ViewInterface where Self: UIViewController {
    func showLoading() {
        LoadingView.shared.startLoading()
    }
    
    func hideLoading() {
        LoadingView.shared.hideLoading()
    }
    
    func showAlert(_ title: String, _ message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
        }
    }
    
}

