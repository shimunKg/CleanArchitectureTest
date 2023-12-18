//
//  CleanArchitectureTestProjectTests.swift
//  CleanArchitectureTestProjectTests
//
//  Created by Nikola Jovanovic Simunic on 18.12.23..
//

import XCTest
@testable import CleanArchitectureTestProject

final class CleanArchitectureTestProjectTests: XCTestCase {
    
    var fetchProfileUseCase: FetchProfileUseCase = ProfileAPIServiceMock()
    var sut: ProfileViewModel?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ProfileViewModel(fetchProfileUseCase: fetchProfileUseCase)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testFetchProfileReturnsValidName() {
        // Given
        let expectation = XCTestExpectation(description: "Fetch profile")
        
        guard let sut = sut else {
            XCTFail("SUT is nil")
            return
        }
        
        // When
        Task {
            do {
                try await sut.fetchProfile()
                // Then
                XCTAssertEqual(sut.name, "Nikola")
            } catch {
                XCTFail("Fetch profile failed with error: \(error)")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}


