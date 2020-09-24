import Foundation

public class AddMemberToGroupDataModel: BaseEncodable {
    let groupId: Int
    let selected: Bool
    let studentId: Int
    
    init(groupId: Int, selected:Bool = true, studentId: Int) {
        self.groupId = groupId
        self.selected = selected
        self.studentId = studentId
    }
    
    enum CodingKeys: String, CodingKey {
        case groupId = "id"
        case selected = "selected"
        case studentId = "student_id"
    }
       
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(groupId, forKey: .groupId)
        try container.encode(selected, forKey: .selected)
        try container.encode(studentId, forKey: .studentId)
    }
}


