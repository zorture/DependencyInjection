//
//  DetailsScreenTest.swift
//  DependencyInjectionTests
//
//  Created by Kanwar Zorawar Singh Rana on 10/8/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import XCTest
@testable import DependencyInjection

class DetailsScreenTest: XCTestCase {

    var detailsVC: DetailsViewController!
    var model: Result!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let data = FileAdapter.decodeJsonData(oftype: List.self, fromFile: "List")
        model = data?.feed.results.first
        detailsVC = DetailsViewController.segueFromStoryboard(withDependency: model)
        XCTAssertNotNil(detailsVC)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

}
