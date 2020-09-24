//
//  RMCharactersViewModel.swift
//  ApiPagingApp
//
//  Created by Vladyslav Pokryshka on 24.09.2020.
//

import Foundation
import Combine

//extension RMCharacter: Identifiable {
//    
//    public var id: String {
//        title ?? UUID().uuidString
//    }
//    
//    var titleTrimmed: String {
//        (title ?? "").replacingOccurrences(of: "\n", with: "")
//    }
//    
//}

final class RMCharactersViewModel: ObservableObject {
    
    @Published private(set) var listDataSource = [RMCharacter]()
    
    @Published private(set) var isPageLoading = false
    @Published private(set) var page: Int = 0
    
    init(isMock: Bool = false) {
        if isMock {
            self.loadMockData()
        }
    }
    
    let networkManager = NetworkManager()
    
    func fetchPage() {
        
        guard isPageLoading == false else {
            return
        }
  
        isPageLoading = true
                
        networkManager.loadCharacters(page) { (characters, errorText) in
            DispatchQueue.main.async {
                self.isPageLoading = false
                
                guard let characters = characters, errorText == nil else {
                    print(errorText ?? "Empty character")
                    return
                }
                self.page += 1
                
                self.listDataSource.append(contentsOf: characters)
            }
        }
    }
    
    func loadMockData() {
        listDataSource = [RMCharacter(id: 1, name: "Test Rick", status: "Alive", species: nil, type: nil, gender: "Male", origin: nil, location: nil, image: nil, episode: nil, url: nil, created: nil),
                          RMCharacter(id: 2, name: "Test Morty", status: "Alive", species: nil, type: nil, gender: "Male", origin: nil, location: nil, image: nil, episode: nil, url: nil, created: nil)]
    }
    
}

