import Foundation

public class SearchGroupsByCoachIdDataModel: BaseEncodable {
    let trainerId: Int

    init(trainerId: Int) {
        self.trainerId = trainerId
    }
    
    enum CodingKeys: String, CodingKey {
        case trainerId = "trainer_id"
    }
       
    override public func encode(to encoder: Encoder) throws {
       var container = encoder.container(keyedBy: CodingKeys.self)
       try container.encode(trainerId, forKey: .trainerId)
   }
}


