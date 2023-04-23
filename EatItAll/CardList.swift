//
//  CardList.swift
//  EatItAll
//
//  Created by 王文杰 on 4/22/23.
//

import SwiftUI

struct CardList: View {
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
    let id: String
    
    let storeLogo: Image
    let storeName: String
    let itemName: String
    let pickupTime: String
    let rating: Double
    let distance: String
    let price: String
    let isFavorite: Bool
    let isOneLeft: Bool
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList()
    }
}
