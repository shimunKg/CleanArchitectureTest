//
//  CleanArchitectureTestProjectApp.swift
//  CleanArchitectureTestProject
//
//  Created by Nikola Jovanovic Simunic on 14.12.23..
//

import SwiftUI

@main
struct CleanArchitectureTestProjectApp: App {
    var profileAPIUseCase: FetchUserUseCase = ProfileAPIService()
    var body: some Scene {
        WindowGroup {
            MainProfileView(profileViewModel: ProfileViewModel(fetchUserUseCase: profileAPIUseCase))
        }
    }
}