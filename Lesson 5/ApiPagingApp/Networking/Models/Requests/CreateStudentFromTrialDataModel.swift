import Foundation

public class CreateStudentFromTrialDataModel: BaseEncodable {
    let studentId: Int
    let trialId: Int
    
    init(studentId: Int, trialId:Int) {
        self.studentId = studentId
        self.trialId = trialId
    }
    
    enum CodingKeys: String, CodingKey {
        case studentId = "student_id"
        case trialId = "trial_id"
    }
       
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(studentId, forKey: .studentId)
        try container.encode(trialId, forKey: .trialId)
    }
}


