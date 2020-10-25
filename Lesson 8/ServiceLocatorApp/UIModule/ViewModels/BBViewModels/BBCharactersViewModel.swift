
import Foundation
import Combine
import TVShowsLibrary

final class BBCharactersViewModel: ObservableObject {
    
    @Published private(set) var listDataSource = [BBCharacter]()
    
    @Published private(set) var isPageLoading = false
    @Published private(set) var offset: Int = 0
    
    private var breakingBadService: BreakingBadApiService? = TVShowsLibraryServiceLocator.service()
    
    private var initialInfoLoaded = false
    private let limit = 10
    
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
                
        breakingBadService?.loadBBCharacters(limit: limit, offset: offset) { (characters, errorText) in
            DispatchQueue.main.async {
                self.isPageLoading = false

                guard let characters = characters, errorText == nil else {
                    print(errorText ?? "Empty character")
                    return
                }
                self.offset += self.limit

                self.listDataSource.append(contentsOf: characters)
            }
        }
    }
    
    func loadMockData() {
        self.listDataSource = [BBCharacter .getMockCharacter(), BBCharacter.getMockCharacter()]
    }
    
}

