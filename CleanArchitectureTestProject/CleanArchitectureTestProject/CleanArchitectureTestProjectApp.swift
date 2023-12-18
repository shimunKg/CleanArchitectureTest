//
//  CleanArchitectureTestProjectApp.swift
//  CleanArchitectureTestProject
//
//  Created by Nikola Jovanovic Simunic on 14.12.23..
//

import SwiftUI
import ShimunNetwork
@main
struct CleanArchitectureTestProjectApp: App {
    var profileAPIUseCase: FetchProfileUseCase = ProfileAPIService(requester: Requester())
    var body: some Scene {
        WindowGroup {
            MainProfileView(profileViewModel: ProfileViewModel(fetchProfileUseCase: profileAPIUseCase))
        }
    }
}
