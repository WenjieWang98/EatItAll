//
//  DetailPage.swift
//  EatItAll
//
//  Created by 王文杰 on 7/22/23.
//

import SwiftUI

struct DetailPage: View {
    let storeLogo: Image
    let storeName: String
    let itemName: String
    let pickupTime: String
    let rating: Double
    let address: String
    let price: String
    let isFavorite: Bool
    let isOneLeft: Bool
    
    var body: some View {
        VStack{
            ScrollView{
                VStack(alignment: .leading) {
                    ZStack(alignment: .bottomLeading) {
                        Image("storeImage")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
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
                    VStack(alignment: .leading){
                        HStack {
                            Image(systemName: "bag")
                            Text(itemName)
                            Spacer()
                            Text(price)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                        }.padding(.horizontal, 10).padding(.vertical, 0.5)
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text(String(format: "%.1f", rating))
                        }.padding(.horizontal, 10).padding(.vertical, 0.5)
                        HStack {
                            Image(systemName: "clock")
                            
                            Text(pickupTime)
                            
                        }.padding(.horizontal, 10).padding(.vertical, 5)
                        Divider()
                        HStack {
                            Image(systemName: "map")
                                .foregroundColor(.green)
                            Text(address)
                                .foregroundColor(.green).padding(.horizontal, 10)
                            Spacer()
                            Image(systemName: "chevron.right")
                        }.padding(.horizontal, 10).padding(.vertical, 5)
                        Divider()
                        VStack(alignment: .leading){
                            Text("What you could get").fontWeight(.bold).padding(.vertical, 1)
                            Text("It's a surprice!When you buy a Surprice Bag, it will be filled with the delicious food that the store has left at the end of the day.")
                        }.padding(.horizontal, 10).padding(.vertical, 5)
                        Divider()
                        HStack {
                            Text("Ingredient & allergens") .foregroundColor(.green)
                            Spacer()
                            Image(systemName: "chevron.right")
                        }.padding(.horizontal, 10).padding(.vertical, 5)
                        Divider()
                    }
                    VStack{
                        VStack(){
                            Text("WHAT OTHER PEOPLE ARE SAYING").fontWeight(.bold)
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow).font(.title2)
                                Text(String(format: "%.1f / 5.0", rating)).fontWeight(.bold).font(.title)
                            }.padding(.horizontal, 10).padding(.vertical, 5)
                        }.padding(.horizontal, 10).padding(.vertical, 5)
                        Divider()
                    }
                }
                .padding(0)
                .background(Color.white)
            }.edgesIgnoringSafeArea(.top)
            VStack{
                Divider()
                Button("Reserve") {
                    // Reserve按钮的点击事件
                    // 在这里添加按钮点击后的操作
                }.padding(.vertical, 15)
                    .padding(.horizontal, 150)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(25)
            }
        }
    }
    
}

struct DetailPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailPage(storeLogo: Image("storeLogo"),
                   storeName: "星巴克",
                   itemName: "惊喜盲盒",
                   pickupTime: "5:00 PM - 6:00 PM",
                   rating: 4.5,
                   address: "2929 Broadway, New York, NY 10025",
                   price: "$5.99",
                   isFavorite: false,
                   isOneLeft: true)
    }
}
