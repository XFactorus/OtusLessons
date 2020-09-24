import Foundation

public class SendAttendanceDataModel: BaseEncodable {
    let studentId: Int
    let trainerId: Int
    
    init(studentId: Int, trainerId: Int) {
        self.studentId = studentId
        self.trainerId = trainerId
    }
    
    enum CodingKeys: String, CodingKey {
        case studentId = "student_id"
        case trainerId = "trainer_id"
    }
       
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(studentId, forKey: .studentId)
        try container.encode(trainerId, forKey: .trainerId)
    }
}


