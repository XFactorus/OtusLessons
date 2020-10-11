//
//  RMInfo.swift
//  ServiceLocatorApp
//
//  Created by Vladyslav Pokryshka on 24.09.2020.
//

import Foundation

// MARK: - Info
struct RMInfo: Codable {
    let count, pages: Int?
    let next, prev: String?
}
