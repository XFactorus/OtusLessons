import Foundation

@propertyWrapper

struct Injected<T> {
    private var service: T!
    public var container: Resolver? = nil
    public var name: String?
    
    public init(name: String? = nil, container: Resolver? = nil) {
        self.name = name
        self.container = container
    }
    
    public var wrappedValue: T {
        mutating get {
            if self.service == nil {
                self.service = container?.resolve(type: T.self) ?? Resolver.shared.resolve(type: T.self)
            }
            return service
        }
        mutating set {service = newValue}
    }
    
    public var projectedValue: Injected<T> {
        get {return self}
        mutating set { self = newValue }
    }
}
