//
//  ContentView.swift
//  CleanArchitectureTestProject
//
//  Created by Nikola Jovanovic Simunic on 14.12.23..
//

import SwiftUI

struct MainProfileView: View {
    @ObservedObject var profileViewModel: ProfileViewModel
    var body: some View {
        VStack {
            // I highly dislike this below // more on it in the viewModel ->
            Text("Fetched user name is: \(profileViewModel.profile?.name ?? "")")
//            <-
        }
        .padding()
        .task {
            do {
                try await profileViewModel.fetchProfile()
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    let testProfileUseCase: FetchUserUseCase = ProfileAPIServiceMock()
    let profileVM = ProfileViewModel(fetchUserUseCase: testProfileUseCase)
    return MainProfileView(profileViewModel: profileVM)
}
