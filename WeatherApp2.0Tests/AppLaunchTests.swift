//
//  AppLaunchTests.swift
//  WeatherApp2.0Tests
//
//  Created by waheedCodes on 25/03/2024.
//

import XCTest
@testable import WeatherApp2_0

final class AppLaunchTests: XCTestCase {

    func test_emptyJustSoWeHaveAPassingTest() {}
    
    func test_application_shouldBeTrue() {
        let application = AppDelegate()
            .application(
                UIApplication.shared,
                didFinishLaunchingWithOptions: nil)
        
        XCTAssertTrue(application)
    }
}
