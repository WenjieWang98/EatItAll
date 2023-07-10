//
//  ContentView.swift
//  EatItAll
//
//  Created by 王文杰 on 4/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var responseData: String = ""
    let httpClient = HTTPClient()
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
        ]
    var body: some View {
        ScrollView{
            VStack {
                SearchBar(text: $searchText, placeholder: "Search")
                VStack(alignment: .leading) {
                    HStack{
                        Text("附近的惊喜盲盒")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.top, 5)
                            .padding(.horizontal, 10)
                        Spacer()
                        Text("See all")
                            .font(.subheadline)
                            .foregroundColor(Color.green)
                    }.padding(.horizontal, 10)
                    
                    CardList(cardList:cardList)
                }.padding(.vertical, 10)
                VStack(alignment: .leading) {
                    HStack{
                        Text("推荐盲盒")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.top, 5)
                            .padding(.horizontal, 10)
                        Spacer()
                        Text("See all")
                            .font(.subheadline)
                            .foregroundColor(Color.green)
                    }.padding(.horizontal, 10)
                    
                    CardList(cardList:cardList)
                }.padding(.vertical, 10)
                VStack(alignment: .leading) {
                    HStack{
                        Text("明天再来拿")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.top, 5)
                            .padding(.horizontal, 10)
                        Spacer()
                        Text("See all")
                            .font(.subheadline)
                            .foregroundColor(Color.green)
                    }.padding(.horizontal, 10)
                    
                    CardList(cardList:cardList)
                }.padding(.vertical, 10)
            }.onAppear {
                sendRequest()
                print("responseData")
                print(responseData)
            }
        }.background{
            Color("Background").ignoresSafeArea()
        }
     
    }
    func sendRequest() {
        httpClient.sendGetRequest(api: "/get_stores") { data, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    DispatchQueue.main.async {
                        responseData = responseString
                    }
                }
            }
        }
    }
}



func SearchBar(text: Binding<String>, placeholder: String) -> some View {
    HStack {
        TextField(placeholder, text: text)
            .padding(7)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                }
            )
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        if !text.wrappedValue.isEmpty {
            Button(action: {
                text.wrappedValue = ""
            }) {
                Text("Cancel")
                    .foregroundColor(Color(.systemBlue))
            }
            .padding(.trailing, 10)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
