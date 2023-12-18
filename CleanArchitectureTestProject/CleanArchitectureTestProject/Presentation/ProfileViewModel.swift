//
//  ProfileViewModel.swift
//  CleanArchitectureTestProject
//
//  Created by Nikola Jovanovic Simunic on 14.12.23..
//

import Foundation

final class ProfileViewModel: ObservableObject {

    private (set) var profile: Profile?
    @Published var name: String = "No name"
    
    private var fetchProfileUseCase: FetchProfileUseCase
    
    init(fetchProfileUseCase: FetchProfileUseCase) {
        self.fetchProfileUseCase = fetchProfileUseCase
    }
    
    @MainActor
    func fetchProfile() async throws {
        do {
            profile = try await fetchProfileUseCase.fetchProfile()
            name = profile?.name ?? ""
        } catch {
            throw(error)
        }
    }
}
