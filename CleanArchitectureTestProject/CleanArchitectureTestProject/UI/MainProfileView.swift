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
            HStack {
                Text("Fetched user name is: ")
                Text(profileViewModel.name)
                    .redacted(reason: profileViewModel.profile == nil ? .placeholder: [])
            }
        }
        .padding()
        .task {
            await fetchProfile()
        }
    }
    
    private func fetchProfile() async {
        do {
            try await profileViewModel.fetchProfile()
        } catch {
            print(error)
        }
    }
}

#Preview {
    let testProfileUseCase: FetchProfileUseCase = ProfileAPIServiceMock()
    let profileVM = ProfileViewModel(fetchProfileUseCase: testProfileUseCase)
    return MainProfileView(profileViewModel: profileVM)
}
