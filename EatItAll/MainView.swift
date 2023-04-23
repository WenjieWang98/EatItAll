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
                    Label("Discover", systemImage: "safari")
                }
            BrowserPage()
                .tabItem{
                    Label("Browser", systemImage: "bag")
                }
            FavoritePage()
                .tabItem{
                    Label("Favorite", systemImage: "heart")
                }
            ProfilePage()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
