//
//  MockFavouriteRouter.swift
//  SezilAkdogan_TurkcellCaseTests
//
//  Created by Sezil Akdoğan on 20.07.2023.
//



import Foundation
@testable import SezilAkdogan_TurkcellCase

final class MockFavouriteRouter: FavouriteRouterInterface {
    
    var isInvokedNavigate = false
    var invokedNavigateCount = 0
    var receivedSlug: String?
    //var invokedNavigateParameters: (slug: , Void)?
    
    func navigateToDetail(slug: String?) {
        isInvokedNavigate = true
        invokedNavigateCount += 1
        receivedSlug = slug
        //invokedNavigateParameters = (slug, ())
    }

}
