//
//  ListScreenTest.swift
//  DependencyInjectionTests
//
//  Created by Kanwar Zorawar Singh Rana on 10/8/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import XCTest
@testable import DependencyInjection

class ListScreenTest: XCTestCase {

    var listVC: ListTableViewController!
    var model: [Result]!
    override func setUp() {
        
        let data = FileAdapter.decodeJsonData(oftype: List.self, fromFile: "List")
        model  = data?.feed.results
        listVC = ListTableViewController.segueFromStoryboard(withDependency: model)
        XCTAssertNotNil(listVC)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
         super.tearDown()
    }

    func testTableViewRowCount(){
        let count = listVC.tableView(listVC.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(count, model.count)
        XCTAssertEqual(count, 50)
    }
    
    func testTableViewCell(){
        let cell = listVC.tableView(listVC.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.textLabel?.text, "DJ Snake")
    }

}
