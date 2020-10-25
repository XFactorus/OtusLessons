//
//  RMCharactersViewModel.swift
//  ServiceLocatorApp
//
//  Created by Vladyslav Pokryshka on 24.09.2020.
//

import Foundation
import Combine
import TVShowsLibrary

final class RMCharactersViewModel: ObservableObject {
    
    @Published private(set) var listDataSource = [RMCharacter]()
    
    @Published private(set) var isPageLoading = false
    @Published private(set) var page: Int = 1
    
    private var rickMortyService: RickMortyApiService? = TVShowsLibraryServiceLocator.service()
    
    private var initialInfoLoaded = false
    
    init(isMock: Bool = false) {
        if isMock {
            self.loadMockData()
        }
    }

    func loadInitialList() {
        if !initialInfoLoaded {
            initialInfoLoaded.toggle()
            fetchPage()
        }
    }
    
    func fetchPage() {
        
        guard isPageLoading == false else {
            return
        }
  
        isPageLoading = true
                
        rickMortyService?.loadRMCharacters(page) { (characters, errorText) in
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
        listDataSource = [RMCharacter.getMockCharacter(), RMCharacter.getMockCharacter()]
    }
    
}

