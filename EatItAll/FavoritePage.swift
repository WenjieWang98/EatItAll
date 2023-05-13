//
//  FavoritePage.swift
//  EatItAll
//
//  Created by 王文杰 on 4/22/23.
//

import SwiftUI

struct FavoritePage: View {
    var body: some View {
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
            )
        ]
        VStack{
            HStack{
                Text("收藏").font(.title)
                    .fontWeight(.bold).padding(.horizontal)
                Spacer()
            }
            ScrollView(.vertical, showsIndicators: false){
                VStack{
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
                        ).padding(.horizontal, 15).padding(.vertical, 10)
                    }
                }
            }
        }
    }
}

struct FavoritePage_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePage()
    }
}
