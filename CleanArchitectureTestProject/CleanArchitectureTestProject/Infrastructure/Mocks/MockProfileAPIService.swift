//
//  MockProfileAPIService.swift
//  CleanArchitectureTestProject
//
//  Created by Nikola Jovanovic Simunic on 17.12.23..
//

import Foundation

final class ProfileAPIServiceMock: FetchProfileUseCase {
    
    func fetchProfile() async throws -> Profile {
        try await Task.sleep(nanoseconds: 3 * 1_000_000_000)
        return Profile(name: "Nikola")
    }
    
}
