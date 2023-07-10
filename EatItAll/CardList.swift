//
//  CardList.swift
//  EatItAll
//
//  Created by 王文杰 on 4/22/23.
//

import SwiftUI

struct CardList: View {
    let cardList: [cardData]
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 40) {
                ForEach(cardList) { card in
                    CardView(storeLogo: card.storeLogo,
                             storeName: card.storeName,
                             itemName: card.itemName,
                             pickupTime: card.pickupTime,
                             rating: card.rating,
                             distance: card.distance,
                             price: card.price,
                             isFavorite: card.isFavorite,
                             isOneLeft: card.isOneLeft
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
    var id: String
    
    var storeName: String
    var itemName: String
    var pickupTime: String
    var rating: Double
    var distance: String
    var price: String
    var isFavorite: Bool
    var isOneLeft: Bool
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        let cardList: [cardData] = [
            cardData(
                 id: "1",
                 storeLogo: Image("storeLogo"),
                 storeName: "星巴克",
                 itemName: "惊喜盲盒",
                 pickupTime: "5:00 PM - 6:00 PM",
                 rating: 4.5,
                 distance: "0.5 公里",
                 price: "$5.99",
                 isFavorite: false,
                 isOneLeft: true
            ),
            cardData(
                 id: "1",
                 storeLogo: Image("storeLogo"),
                 storeName: "星巴克",
                 itemName: "惊喜盲盒",
                 pickupTime: "5:00 PM - 6:00 PM",
                 rating: 4.5,
                 distance: "0.5 公里",
                 price: "$5.99",
                 isFavorite: false,
                 isOneLeft: true
            ),
            cardData(
                 id: "1",
                 storeLogo: Image("storeLogo"),
                 storeName: "星巴克",
                 itemName: "惊喜盲盒",
                 pickupTime: "5:00 PM - 6:00 PM",
                 rating: 4.5,
                 distance: "0.5 公里",
                 price: "$5.99",
                 isFavorite: false,
                 isOneLeft: true
            ),
            cardData(
                 id: "1",
                 storeLogo: Image("storeLogo"),
                 storeName: "星巴克",
                 itemName: "惊喜盲盒",
                 pickupTime: "5:00 PM - 6:00 PM",
                 rating: 4.5,
                 distance: "0.5 公里",
                 price: "$5.99",
                 isFavorite: false,
                 isOneLeft: true
            ),
            ]
        CardList(cardList: cardList)
    }
}
