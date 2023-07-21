//
//  MockHomeViewController.swift
//  SezilAkdogan_TurkcellCaseTests
//
//  Created by Sezil Akdoğan on 20.07.2023.
//

import Foundation
@testable import SezilAkdogan_TurkcellCase

final class MockHomeViewController: HomeViewInterface {
    
    var isUIPrepared = false
    var isHeaderCollectionViewReloaded = false
    var isListCollectionViewReloaded = false
    var isNoResultViewHidden = true
    var isHeaderViewHidden = false
    var showLoadingCalled = false
    var hideLoadingCalled = false
    var showAlertCalled = false
    var alertTitle: String?
    var alertMessage: String?
    var isButtonTitle: String?
    var isCompletion: (() -> Void)?
    
    func prepareUI() {
        isUIPrepared = true
    }
    
    func reloadHeaderCollectionView() {
        isHeaderCollectionViewReloaded = true
    }
    
    func reloadListCollectionView() {
        isListCollectionViewReloaded = true
    }
    
    func showNoResultView(isHidden: Bool) {
        isNoResultViewHidden = isHidden
    }
    
    func showHeaderView(isHidden: Bool) {
        isHeaderViewHidden = isHidden
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
