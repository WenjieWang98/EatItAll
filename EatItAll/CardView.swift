//
//  CardView.swift
//  EatItAll
//
//  Created by 王文杰 on 4/22/23.
//

import SwiftUI

struct CardView: View {
    let storeLogo: Image
    let storeName: String
    let itemName: String
    let pickupTime: String
    let rating: Double
    let distance: String
    let price: String
    let isFavorite: Bool
    let isOneLeft: Bool
    let address: String
    
    var body: some View {
            NavigationLink(destination: DetailPage(storeLogo: storeLogo, storeName: storeName, itemName: itemName, pickupTime: pickupTime, rating: rating, address: address, price: price, isFavorite: isFavorite, isOneLeft: isOneLeft)){
                VStack(alignment: .leading) {
                    ZStack(alignment: .bottomLeading) {
                        Image("storeImage")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 133)
                            .cornerRadius(0)
                        VStack() {
                            HStack {
                                if isOneLeft{
                                    VStack() {
                                        Text("1 left")
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.green)
                                            .padding(5)
                                    }.background(Color.yellow)
                                        .cornerRadius(15)
                                }
                                Spacer()
                                if isFavorite {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.red)
                                }
                                else{
                                    Image(systemName: "heart")
                                        .foregroundColor(.white)
                                }
                            }.padding(10)
                            HStack {
                                storeLogo
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(90)
                                Text(storeName)
                                    .font(.title2)
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                                Spacer()
                            }.padding(10)
                        }
                    }
                    Text(itemName)
                        .font(.title3)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .padding(.top, 4)
                        .padding(.horizontal, 10)
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(.gray)
                        Text(pickupTime)
                            .foregroundColor(.gray)
                        Spacer()
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(String(format: "%.1f", rating))
                            .foregroundColor(.gray)
                    }.padding(.horizontal, 10).padding(.vertical, 0.5)
                    HStack {
                        Image(systemName: "location.fill")
                            .foregroundColor(.gray)
                        Text(distance)
                            .foregroundColor(.gray)
                        Spacer()
                        Text(price)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                    }.padding(.horizontal, 10).padding(.vertical, 1)
                }
                .padding(0)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 5)
                .frame(width: 325)
            }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(storeLogo: Image("storeLogo"),
                 storeName: "星巴克",
                 itemName: "惊喜盲盒",
                 pickupTime: "5:00 PM - 6:00 PM",
                 rating: 4.5,
                 distance: "0.5 公里",
                 price: "$5.99",
                 isFavorite: false,
                 isOneLeft: true,
                 address: "2929 Broadway, New York, NY 10025"
        )
    }
}
