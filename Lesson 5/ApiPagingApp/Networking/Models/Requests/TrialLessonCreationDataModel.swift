import Foundation

public class TrialLessonCreationDataModel: BaseEncodable {
    var fname: String? = nil
    var mname: String? = nil
    var lname: String? = nil
    var phone: String? = nil
    var birthDate: Int? = nil
    var learnedFrom: Int? = nil
    var trainerId: Int? = nil
    var groupId: Int? = nil
    
    enum CodingKeys: String, CodingKey {
        case fname = "fname"
        case mname = "mname"
        case lname = "lname"
        case phone = "phone"
        case birthDate = "birth_date"
        case learnedFrom = "learned_from"
        case trainerId = "trainer_id"
        case groupId = "group_id"
    }
    
    init(fname: String?, mname: String?, lname: String?, phone: String?, birthDate: Int?, learnedFrom: Int?, trainerId: Int?, groupId: Int?) {
        self.fname = fname
        self.mname = mname
        self.lname = lname
        self.phone = phone
        self.birthDate = birthDate
        self.learnedFrom = learnedFrom
        self.trainerId = trainerId
        self.groupId = groupId
    }
               
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(fname, forKey: .fname)
        try? container.encode(mname, forKey: .mname)
        try? container.encode(lname, forKey: .lname)
        try? container.encode(phone, forKey: .phone)
        try? container.encode(birthDate, forKey: .birthDate)
        try? container.encode(learnedFrom, forKey: .learnedFrom)
        try container.encode(trainerId, forKey: .trainerId)
        try? container.encode(groupId, forKey: .groupId)
    }
}


