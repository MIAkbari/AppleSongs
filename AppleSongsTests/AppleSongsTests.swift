//
//  AppleSongsTests.swift
//  AppleSongsTests
//
//  Created by Mohammad on 6/13/23.
//

import XCTest
import Combine
@testable import AppleSongs

final class AppleSongsTests: XCTestCase {
    
    var viewModel = SearchViewModel()
    var subscribers: Set<AnyCancellable>!

    // MARK: - Lifecycle

    override func setUpWithError() throws {
        try super.setUpWithError()

        subscribers = []
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()

        subscribers.forEach { $0.cancel() }
    }
    
    // MARK: - Tests

    // testSearchWithSucces
    func testSearchWithSucces() throws {
        var areInputsValid = false
        let expectation = expectation(description: "Valid text from search")

        viewModel.fetchSearch(term: "Justin", limit: 5)
        
        viewModel.searchCompletion
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] response in
                guard let self = self else { return }
                
                areInputsValid = true
                expectation.fulfill()
            })
            .store(in: &subscribers)

        waitForExpectations(timeout: 5.0, handler: nil)
        XCTAssert(areInputsValid, "The search api has issue")
    }
    
    // testSearchWithFailer
    func testSearchWithFailer() throws {
        var areInputsValid = false
        let expectation = expectation(description: "Not valida text for search")

        viewModel.fetchSearch(term: "", limit: 0)
        
        viewModel.searchCompletion
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] response in
                guard let self = self else { return }
                
                areInputsValid = true
                expectation.fulfill()
            })
            .store(in: &subscribers)

        waitForExpectations(timeout: 5.0, handler: nil)
        XCTAssert(areInputsValid, "The search api has issue")
    }
}
