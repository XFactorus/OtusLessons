import Foundation

public class CoachPayForMemberDataModel: BaseEncodable {
    let studentId: String
    
    init(studentId: String) {
        self.studentId = studentId
    }
    
    enum CodingKeys: String, CodingKey {
        case studentId = "student_id"
    }
       
    override public func encode(to encoder: Encoder) throws {
       var container = encoder.container(keyedBy: CodingKeys.self)
       try container.encode(studentId, forKey: .studentId)
   }
}


