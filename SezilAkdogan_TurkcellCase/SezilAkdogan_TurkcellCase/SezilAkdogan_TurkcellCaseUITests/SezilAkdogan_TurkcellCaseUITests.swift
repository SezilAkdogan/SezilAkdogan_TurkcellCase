//
//  SezilAkdogan_TurkcellCaseUITests.swift
//  SezilAkdogan_TurkcellCaseUITests
//
//  Created by Sezil Akdoğan on 11.07.2023.
//

import XCTest

final class SezilAkdogan_TurkcellCaseUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("******** UITest ********")
        app.launch()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    override func tearDownWithError() throws {
        // Not needed for this test case
    }
    
    func test_search(){
        let app = XCUIApplication()
        app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["2013-03-05"]/*[[".cells.staticTexts[\"2013-03-05\"]",".staticTexts[\"2013-03-05\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Video Games"].buttons["Video Games"].tap()
    }
    
    func test_navigate_home_to_detail() {
        let app = XCUIApplication()
        let collectionViewsQuery2 = app.collectionViews
        let staticText = collectionViewsQuery2/*@START_MENU_TOKEN@*/.staticTexts["2012-08-21"]/*[[".cells.staticTexts[\"2012-08-21\"]",".staticTexts[\"2012-08-21\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        staticText.tap()
        
        let tabBar = app.tabBars["Tab Bar"]
        let videoGamesButton = tabBar.buttons["Video Games"]
        videoGamesButton.tap()
        
        let collectionViewsQuery = collectionViewsQuery2
        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["2007-10-09"]/*[[".cells.staticTexts[\"2007-10-09\"]",".staticTexts[\"2007-10-09\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        
        let left4Dead2StaticText = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Left 4 Dead 2"]/*[[".cells.staticTexts[\"Left 4 Dead 2\"]",".staticTexts[\"Left 4 Dead 2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        let loveButton = app.buttons["love"]
        loveButton.tap()
        
        let favouriteButton = tabBar.buttons["Favourite"]
        favouriteButton.tap()
        favouriteButton.tap()
        
        videoGamesButton.tap()
        videoGamesButton.tap()
        
        
    }
}
