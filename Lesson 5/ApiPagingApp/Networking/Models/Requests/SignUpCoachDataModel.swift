import Foundation

public class SignUpCoachDataModel: BaseEncodable {
    let login: String
    let password: String
    
    init(login: String, password: String) {
        self.login = login
        self.password = password
    }
    
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case password = "password"
    }
       
    override public func encode(to encoder: Encoder) throws {
       var container = encoder.container(keyedBy: CodingKeys.self)
       try container.encode(login, forKey: .login)
       try container.encode(password, forKey: .password)
   }
}


