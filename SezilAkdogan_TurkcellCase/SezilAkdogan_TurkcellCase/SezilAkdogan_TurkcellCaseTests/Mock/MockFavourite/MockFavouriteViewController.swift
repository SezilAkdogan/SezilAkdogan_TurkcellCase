//
//  MockFavouriteViewController.swift
//  SezilAkdogan_TurkcellCaseTests
//
//  Created by Sezil Akdoğan on 20.07.2023.
//

import Foundation
@testable import SezilAkdogan_TurkcellCase

final class MockFavouriteViewController: FavouriteViewInterface {
    
    var prepareUICalled = false
    var reloadDataCalled = false
    var updateEmptyViewCalled = false
    var isHiddenValue: Bool?
    var showLoadingCalled = false
    var hideLoadingCalled = false
    var showAlertCalled = false
    var alertTitle: String?
    var alertMessage: String?
    var isButtonTitle: String?
    var isCompletion: (() -> Void)?
    
    func prepareUI() {
        prepareUICalled = true
    }
    
    func reloadData() {
        reloadDataCalled = true
    }
    
    func updateEmptyView(with isHidden: Bool) {
        updateEmptyViewCalled = true
        isHiddenValue = isHidden
    }
    
    func showLoading() {
        showLoadingCalled = true
    }
    
    func hideLoading() {
        hideLoadingCalled = true
    }
    
    func showAlert(_ title: String, _ message: String) {
        showAlertCalled = true
        alertTitle = title
        alertMessage = message
    }
    
    func showAlert(_ title: String, _ message: String, buttonTitle: String, completion: (() -> Void)?) {
        showAlertCalled = true
        alertTitle = title
        alertMessage = message
        isButtonTitle = buttonTitle
        isCompletion = completion
    }
    
}

