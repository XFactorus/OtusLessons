import Foundation

public class SearchMembersByGroupDataModel: BaseEncodable {
    let groupId: Int

    init(groupId: Int) {
        self.groupId = groupId
    }
    
    enum CodingKeys: String, CodingKey {
        case groupId = "group_id"
    }
       
    override public func encode(to encoder: Encoder) throws {
       var container = encoder.container(keyedBy: CodingKeys.self)
       try container.encode(groupId, forKey: .groupId)
   }
}


