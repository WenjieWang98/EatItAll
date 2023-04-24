//
//  MainView.swift
//  EatItAll
//
//  Created by biru on 4/22/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem{
                    Label("推荐", systemImage: "safari")
                }
            BrowserPage()
                .tabItem{
                    Label("浏览", systemImage: "bag")
                }
            FavoritePage()
                .tabItem{
                    Label("收藏", systemImage: "heart")
                }
            ProfilePage()
                .tabItem{
                    Label("我的", systemImage: "person.circle")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
