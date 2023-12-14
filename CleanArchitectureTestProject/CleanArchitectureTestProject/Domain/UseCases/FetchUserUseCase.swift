//
//  FetchUserUseCase.swift
//  CleanArchitectureTestProject
//
//  Created by Nikola Jovanovic Simunic on 14.12.23..
//

import Foundation

protocol FetchUserUseCase {
    func fetchUser() async throws -> Profile
}
