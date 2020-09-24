import Foundation

public class TransactionCompletedDataModel: BaseEncodable {
    let orderId: String
    let liqpayOrderId: String
    
    init(orderId: String, liqpayOrderId: String) {
        self.orderId = orderId
        self.liqpayOrderId = liqpayOrderId
    }
    
    enum CodingKeys: String, CodingKey {
        case orderId = "order_id"
        case liqpayOrderId = "liqpay_order_id"
    }
       
    override public func encode(to encoder: Encoder) throws {
       var container = encoder.container(keyedBy: CodingKeys.self)
       try container.encode(orderId, forKey: .orderId)
       try container.encode(liqpayOrderId, forKey: .liqpayOrderId)
   }
}


