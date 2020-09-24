//
//  RMCharacter.swift
//  ApiPagingApp
//
//  Created by Vladyslav Pokryshka on 24.09.2020.
//

import Foundation

// MARK: - Result
struct RMCharacter: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin, location: RMLocation?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

// MARK: - Location
struct RMLocation: Codable {
    let name: String
    let url: String
}
