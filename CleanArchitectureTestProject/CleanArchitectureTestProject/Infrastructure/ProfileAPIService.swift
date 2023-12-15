//
//  ProfileAPIService.swift
//  CleanArchitectureTestProject
//
//  Created by Nikola Jovanovic Simunic on 14.12.23..
//

import Foundation
import ShimunNetwork

final class ProfileAPIService: FetchProfileUseCase {
    
    func fetchProfile() async throws -> Profile {
        let request = Request(
            scheme: .https,
            host: "run.mocky.io",
            path: "/v3/c22c4ea6-8d6b-425e-8c99-b7dfbbc697d2",
            method: .get
        )
        return try await Requester().send(request, expect: Profile.self).result
    }
    
    
}

// where should i mock those classes?
// Is it a good practice to to it like so?

final class ProfileAPIServiceMock: FetchProfileUseCase {
    
    func fetchProfile() async throws -> Profile {
        return Profile(name: "Nikola")
    }
    
}
