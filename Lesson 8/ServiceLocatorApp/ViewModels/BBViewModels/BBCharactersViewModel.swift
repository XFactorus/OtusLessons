
import Foundation
import Combine

final class BBCharactersViewModel: ObservableObject {
    
    @Published private(set) var listDataSource = [BBCharacter]()
    
    @Published private(set) var isPageLoading = false
    @Published private(set) var offset: Int = 0
    
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
                
        BreakingBadApiService.service.loadBBCharacters(limit: limit, offset: offset) { (characters, errorText) in
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
        listDataSource = [BBCharacter(id: 1, name: "Walter White", birthday: "09-07-1958", occupation: nil, img: nil, status: "Presumed dead", nickname: "Heisenberg", appearance: nil, portrayed: nil, category: nil, betterCallSaulAppearance: nil),
                          BBCharacter(id: 2, name: "Jesse Pinkman", birthday: "09-24-1984", occupation: nil, img: nil, status: "Alive", nickname: "Cap n' Cook", appearance: nil, portrayed: nil, category: nil, betterCallSaulAppearance: nil)]
    }
    
}

