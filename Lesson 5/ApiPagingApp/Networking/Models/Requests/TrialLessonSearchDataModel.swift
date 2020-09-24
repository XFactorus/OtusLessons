import Foundation

public class TrialLessonSearchDataModel: BaseEncodable {
    let trainer: Int
    let groupId: Int? = nil
    let id: Int? = nil
    let fname: String? = nil
    let mname: String? = nil
    let lname: String? = nil
    let phone: String? = nil
    let birthDate: DateDataModel? = nil
    var createDate: DateDataModel? = nil
    var status: Int? = nil
    
    init(trainer: Int) {
        self.trainer = trainer
    }
    
    enum CodingKeys: String, CodingKey {
        case trainer = "trainer"
        case groupId = "group_id"
        case id = "id"
        case fname = "fname"
        case mname = "mname"
        case lname = "lname"
        case phone = "phone"
        case birthDate = "birth_date"
        case createDate = "create_date"
        case status = "status"
    }
       
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(trainer, forKey: .trainer)
        try? container.encode(groupId, forKey: .groupId)
        try? container.encode(id, forKey: .id)
        try? container.encode(fname, forKey: .fname)
        try? container.encode(mname, forKey: .mname)
        try? container.encode(lname, forKey: .lname)
        try? container.encode(phone, forKey: .phone)
        try? container.encode(birthDate, forKey: .birthDate)
        try? container.encode(createDate, forKey: .createDate)
        try? container.encode(status, forKey: .status)
    }
}


