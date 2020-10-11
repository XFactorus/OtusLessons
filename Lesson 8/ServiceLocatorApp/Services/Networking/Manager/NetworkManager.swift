import Foundation

//enum NetworkResponse:String {
//    case success
//    case authenticationError = "You need to be authenticated first."
//    case badRequest = "Bad request"
//    case outdated = "The url you requested is outdated."
//    case failed = "Network request failed."
//    case noData = "Response returned with no data to decode."
//    case unableToDecode = "We could not decode the response."
//}
//
//enum Result<String>{
//    case success
//    case failure(String)
//}
//
//enum NetworkEnvironment {
//    case production
//}

struct NetworkManager {
    static let environment : NetworkEnvironment = .production
//    let router = Router<RickMortyApi>()

//    func loadRMCharacters( _ page: Int, completion: @escaping (_ characters: [RMCharacter]?, _ error: String?)->()) {
//
//        let router = Router<RickMortyApi>()
//        
//        router.request(.getCharacters(page: page)) { (data, response, error) in
//            if error != nil {
//                completion(nil, error?.localizedDescription)
//            }
//
//            if let response = response as? HTTPURLResponse {
//                let result = self.handleNetworkResponse(response)
//                switch result {
//                case .success:	
//                    guard let responseData = data else {
//                        completion(nil, NetworkResponse.noData.rawValue)
//                        return
//                    }
//                    do {
//                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
//                        //TODO: add logger if needed
//                        print(jsonData)
//                        let apiResponse = try JSONDecoder().decode(RMCharactersInfo.self, from: responseData)
//                        completion(apiResponse.results, nil)
//                    } catch {
//                        completion(nil, NetworkResponse.unableToDecode.rawValue)
//                    }
//                case .failure(let networkFailureError):
//                    completion(nil, networkFailureError)
//                }
//            }
//        }
//    }
//    
//    func downloadRMImage(imageUrl: String, completion: @escaping (_ responseModel: Data?, _ error: String?)->()) {
//        
//        let router = Router<RickMortyApi>()
//        
//        router.request(.downloadImage(imageUrl)) { (data, response, error) in
//            if error != nil {
//                completion(nil, error?.localizedDescription)
//            }
//            
//            if let response = response as? HTTPURLResponse {
//                let result = self.handleNetworkResponse(response)
//                switch result {
//                case .success:
//                    guard let responseData = data else {
//                        completion(nil, NetworkResponse.noData.rawValue)
//                        return
//                    }
//                    
//                    completion(responseData, nil)
//                case .failure(let networkFailureError):
//                    completion(nil, networkFailureError)
//                }
//            }
//        }
//    }
    
//    func loadBBCharacters(limit: Int, offset: Int, completion: @escaping (_ characters: [BBCharacter]?, _ error: String?)->()) {
//
//        let router = Router<BreakingBadApi>()
//
//        router.request(.getCharacters(limit: limit, offset: offset)) { (data, response, error) in
//            if error != nil {
//                completion(nil, error?.localizedDescription)
//            }
//
//            if let response = response as? HTTPURLResponse {
//                let result = self.handleNetworkResponse(response)
//                switch result {
//                case .success:
//                    guard let responseData = data else {
//                        completion(nil, NetworkResponse.noData.rawValue)
//                        return
//                    }
//                    do {
//                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
//                        //TODO: add logger if needed
//                        print(jsonData)
//                        let apiResponse = try JSONDecoder().decode([BBCharacter].self, from: responseData)
//                        completion(apiResponse,nil)
//                    } catch {
//                        completion(nil, NetworkResponse.unableToDecode.rawValue)
//                    }
//                case .failure(let networkFailureError):
//                    completion(nil, networkFailureError)
//                }
//            }
//        }
//    }
//
//    func downloadBBImage(imageUrl: String, completion: @escaping (_ responseModel: Data?, _ error: String?)->()) {
//
//        let router = Router<BreakingBadApi>()
//
//        router.request(.downloadImage(imageUrl)) { (data, response, error) in
//            if error != nil {
//                completion(nil, error?.localizedDescription)
//            }
//
//            if let response = response as? HTTPURLResponse {
//                let result = self.handleNetworkResponse(response)
//                switch result {
//                case .success:
//                    guard let responseData = data else {
//                        completion(nil, NetworkResponse.noData.rawValue)
//                        return
//                    }
//
//                    completion(responseData, nil)
//                case .failure(let networkFailureError):
//                    completion(nil, networkFailureError)
//                }
//            }
//        }
//    }
    
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        print("Response code: \(response.statusCode)")
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
