import Foundation

public class DateDataModel: BaseEncodable {
    let from: Int
    let to: Int
    
    init(from: Int, to:Int) {
        self.from = from
        self.to = to
    }
    
    enum CodingKeys: String, CodingKey {
        case from = "from"
        case to = "to"
    }
       
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(from, forKey: .from)
        try container.encode(to, forKey: .to)
    }
}


