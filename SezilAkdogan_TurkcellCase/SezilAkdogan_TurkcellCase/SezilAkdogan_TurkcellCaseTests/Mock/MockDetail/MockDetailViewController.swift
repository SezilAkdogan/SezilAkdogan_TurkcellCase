//
//  MockDetailViewController.swift
//  SezilAkdogan_TurkcellCaseTests
//
//  Created by Sezil Akdoğan on 20.07.2023.
//

import Foundation
@testable import SezilAkdogan_TurkcellCase

final class MockDetailViewController: DetailViewInterface {
    var isInvokedPrepareUI = false
    var isInvokedUpdateView = false
    var isInvokedUpdateFavouriteButton = false
    var invokedUpdateFavouriteButtonCount = 0
    var isInvokedShowLoading = false
    var invokedShowLoadingCount = 0
    var invokedHideLoadingCount = 0
    var invokedShowAlertCount = 0
    var showAlertCalled = false
    var alertTitle: String?
    var alertMessage: String?

    func prepareUI() {
        isInvokedPrepareUI = true
    }

    func updateView(with gameDetailModel: GameDetailModel) {
        isInvokedUpdateView = true
    }

    func updateFavouriteButton(isFavourite: Bool) {
        isInvokedUpdateFavouriteButton = true
        invokedUpdateFavouriteButtonCount += 1
    }

    func showLoading() {
        isInvokedShowLoading = true
        invokedShowLoadingCount += 1
    }

    func hideLoading() {
        invokedHideLoadingCount += 1
    }

    func showAlert(_ title: String, _ message: String) {
        invokedShowAlertCount += 1
        showAlertCalled = true
        alertTitle = title
        alertMessage = message
    }

    func showAlert(_ title: String, _ message: String, buttonTitle: String, completion: (() -> Void)?) {
        invokedShowAlertCount += 1
    }
}
