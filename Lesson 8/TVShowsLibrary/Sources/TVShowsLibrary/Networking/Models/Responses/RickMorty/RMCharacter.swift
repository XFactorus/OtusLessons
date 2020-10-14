//
//  RMCharacter.swift
//  ServiceLocatorApp
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
    
    static func getMockCharacter() -> RMCharacter {
        return RMCharacter(id: 1,
                           name: "Rick Sanchez",
                           status: "Alive",
                           species: "Human",
                           type: nil,
                           gender: "Male",
                           origin: RMLocation(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                           location: RMLocation(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                           image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                           episode: nil,
                           url: nil,
                           created: nil)
    }
}

// MARK: - Location
struct RMLocation: Codable {
    let name: String
    let url: String
}
