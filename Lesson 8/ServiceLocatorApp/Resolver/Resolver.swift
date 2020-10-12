import Foundation

protocol IResolver {
    func resolve<T>(type: T.Type) -> T?
    func register<T>(service: T)
}

class Resolver: NSObject, IResolver {
    
    static let shared = Resolver()
    private var services: [String: Any] = [String: Any]()
    
    private override init() {
        super.init()
    }
    
    func resolve<T>(type: T.Type) -> T? {
        return services[String(describing: type)] as? T
    }
    
    func register<T>(service: T) {
        let type = String(describing: T.self)
        if services[type] == nil {
            services[type] = service
        }
    }
    
}
