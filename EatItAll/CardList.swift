//
//  CardList.swift
//  EatItAll
//
//  Created by 王文杰 on 4/22/23.
//

import SwiftUI

struct CardList: View {
    let cardList: [cardDatajson]
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 40) {
                ForEach(cardList) { card in
                    CardView( storeLogo: Image("storeLogo"),
                               storeName: card.store_name,
                               itemName: "惊喜盲盒",
                               pickupTime:card.pick_up_time,
                               rating: 4.5,
                               distance: "0.5 公里",
                               price:card.price,
                               isFavorite: false,
                               isOneLeft: card.package_left == 1,
                              address: card.store_address
                    )
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct cardData: Identifiable {
    var id: String
    
    var storeLogo: Image
    var storeName: String
    var itemName: String
    var pickupTime: String
    var rating: Double
    var distance: String
    var price: String
    var isFavorite: Bool
    var isOneLeft: Bool
}

struct cardDatajson: Identifiable, Decodable {
    var id: String { store_id }
    var store_id: String
    var store_name: String
    var store_address: String
    var pick_up_time: String
//    var rating: Double
//    var distance: String
    var price: String
    var package_left: Int
//    var isFavorite: Bool
//    var isOneLeft: Bool
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        let cardList: [cardDatajson] = [
            cardDatajson(
                 store_id: "1",
                 store_name: "星巴克",
                 store_address: "2929 Broadway, New York, NY 10025",
                 pick_up_time: "5:00 PM - 7:00 PM",
                 price: "$5.99",
                 package_left: 10
            ),
            cardDatajson(
                 store_id: "1",
                 store_name: "星巴克",
                 store_address: "2929 Broadway, New York, NY 10025",
                 pick_up_time: "5:00 PM - 7:00 PM",
                 price: "$5.99",
                 package_left: 10
            ),
            ]
        CardList(cardList: cardList)
    }
}
