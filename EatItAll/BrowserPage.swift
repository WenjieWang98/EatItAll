//
//  BrowserPage.swift
//  EatItAll
//
//  Created by 王文杰 on 4/22/23.
//

import SwiftUI

struct BrowserPage: View {
    @State private var searchText = ""
    @State private var showList: Bool = true
    var body: some View {
        NavigationView {
            VStack{
                SearchBar(text: $searchText, placeholder: "Search")
                HStack{
                    ListButton(showList: $showList)
                    MapButton(showList: $showList)
                }
                
                if showList {
                    ListView()
                } else {
                    MapView()
                }
            }
        }
    }
}

struct ListView: View {
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
                             isOneLeft: card.isOneLeft,
                             address: "2929 Broadway, New York, NY 10025"
                    ).padding(.horizontal, 15).padding(.vertical, 10)
                }
            }
        }
        
    }
}

struct MapView: View {
    var body: some View {
        VStack{
            Spacer()
            Text("This is the map")
            Spacer()
        }
    }
}

struct MapButton: View {
    @Binding var showList: Bool
    
    var body: some View {
        Button(action: {
            showList = false
        }) {
            Text("Map")
                .frame(width: 145, height: 10)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

struct ListButton: View {
    @Binding var showList: Bool
    
    var body: some View {
        Button(action: {
            showList = true
        }) {
            Text("List")
                .frame(width: 145, height: 10)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
               
        }
    }
}

struct BrowserPage_Previews: PreviewProvider {
    static var previews: some View {
        BrowserPage()
    }
}
