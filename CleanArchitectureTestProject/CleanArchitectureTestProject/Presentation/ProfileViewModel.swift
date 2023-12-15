//
//  ProfileViewModel.swift
//  CleanArchitectureTestProject
//
//  Created by Nikola Jovanovic Simunic on 14.12.23..
//

import Foundation

final class ProfileViewModel: ObservableObject {
    // I would like to dissalow the viewModel to emit the whole USER object, since maybe the UI is interested only in Name and i'm providing it with all other data that it's not interested in.
    
    @Published var profile: Profile?
    private var fetchProfileUseCase: FetchProfileUseCase
    
    init(fetchProfileUseCase: FetchProfileUseCase) {
        self.fetchProfileUseCase = fetchProfileUseCase
    }
    
    @MainActor
    func fetchProfile() async throws {
        do {
            profile = try await fetchProfileUseCase.fetchProfile()
        } catch {
            throw(error)
        }
    }
}
