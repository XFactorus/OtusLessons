import Foundation

public class EditMemberDataModel: BaseEncodable {
    let id: Int
    let fname: String?
    let mname: String?
    let lname: String?
    let phone: String?
    let kuId: Int?
    let birthDate: Int?
    
    init(id: Int, fname: String?, mname: String?, lname: String?, phone: String?, kuId: Int?, birthDate: Int?) {
        self.id = id
        self.fname = fname
        self.mname = mname
        self.lname = lname
        self.phone = phone
        self.kuId = kuId
        self.birthDate = birthDate
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case fname = "fname"
        case mname = "mname"
        case lname = "lname"
        case phone = "phone"
        case kuId = "ku_id"
        case birthDate = "birth_date"
    }
       
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(fname, forKey: .fname)
        try container.encode(mname, forKey: .mname)
        try container.encode(lname, forKey: .lname)
        try container.encode(phone, forKey: .phone)
        
//        if let kuId = self.kuId {
            try? container.encode(kuId, forKey: .kuId)
//        }
        
//        if let birthDate = self.birthDate {
            try container.encode(birthDate, forKey: .birthDate)
//        }
    }
}


