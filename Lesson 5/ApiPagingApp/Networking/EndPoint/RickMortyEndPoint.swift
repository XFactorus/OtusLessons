
import Foundation

public enum RickMortyApi {
    case getCharacters(page: Int)
}

extension RickMortyApi: EndPointType {
    
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "https://rickandmortyapi.com/api/"
        }
    }
    
    var baseURL: URL {
        switch self {
        default:
            guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
            return url
        }
    }
    
    var baseAuthenticationHeader: HTTPHeaders {
        return ["Authorization":"Basic \("")"]
    }
    
    var path: String {
        switch self {
        case .getCharacters:
            return "character/"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        default:
             return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getCharacters(let page):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["page":page])
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}


