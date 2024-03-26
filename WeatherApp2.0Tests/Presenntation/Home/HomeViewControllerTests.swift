//
//  HomeViewControllerTests.swift
//  WeatherApp2.0Tests
//
//  Created by waheedCodes on 25/03/2024.
//

import XCTest
@testable import WeatherApp2_0

final class HomeViewControllerTests: XCTestCase {
    
    var storyboard: UIStoryboard!
    var sut: HomeViewController!
    
    override func setUp() {
        super.setUp()
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard
            .instantiateViewController(
                identifier: String(
                    describing: HomeViewController.self
                )
            )
    }
    
    override func tearDown() {
        storyboard = nil
        sut = nil
        super.tearDown()
    }

    func test_loading() {
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.locationTextField)
        XCTAssertNotNil(sut.getWeatherInfoButton)
    }
    
    func test_homeViewControllerOutlets_shouldBeConnected() {
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.locationTextField, "locationTextField")
        XCTAssertNotNil(sut.getWeatherInfoButton, "getWeatherInfoButton")
    }
}
