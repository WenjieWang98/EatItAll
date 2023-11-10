//
//  ProfilePage.swift
//  EatItAll
//
//  Created by 王文杰 on 4/22/23.
//

import SwiftUI

struct ProfilePage: View {
    var body: some View {
        if UserDefaults.standard.bool(forKey: "isLoggedIn"){
            NavigationView {
                VStack {
                    HStack(spacing: 20) {
                        NavigationLink(destination: MoneySavedView()) {
                            ButtonView(title: "Money Saved", imageName: "dollarsign")
                        }
                        NavigationLink(destination: YourOrdersView()) {
                            ButtonView(title: "Your Orders", imageName: "cart")
                        }
                        NavigationLink(destination: CO2ESavedView()) {
                            ButtonView(title: "CO2E Saved", imageName: "leaf")
                        }
                    }
                    .padding(.top, 10)
                    VStack(spacing: 20) {
                        NavigationLink(destination: SettingsView()) {
                            ButtonView2(title: "Settings", imageName: "gearshape")
                        }
                        
                        NavigationLink(destination: StoreLoginView()) {
                            ButtonView2(title: "Store login", imageName: "bag")
                            
                        }
                        
                        NavigationLink(destination: HelpCenterView()) {
                            ButtonView2(title: "Help Center", imageName: "questionmark.circle")
                        }
                        
                        NavigationLink(destination: LegalView()) {
                            ButtonView2(title: "Legal", imageName: "hammer")
                        }
                        
                        NavigationLink(destination: ProfilePage().navigationBarBackButtonHidden(true)){
                            ButtonView2(title: "Log Out", imageName: "arrow.right.circle.fill")
                        }.simultaneousGesture(TapGesture().onEnded{
                            logout()
                        })
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                }
            }
            .navigationBarTitle("Profile")
            .padding()
        } else {
            StartView()
        }
    }
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: "isLoggedIn")
    }
}

struct ButtonView: View {
    let title: String
    let imageName: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.system(size: 30))
                .foregroundColor(.blue)
                .frame(width: 60, height: 60)
                .background(Color.blue.opacity(0.2))
                .cornerRadius(30)
            
            Text(title)
                .foregroundColor(.black)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)
                .frame(height: 40)
                .background(Color.white)
                .cornerRadius(20)
        }
    }
}

struct ButtonView2: View {
    let title: String
    let imageName: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
        
            Text(title)
                .foregroundColor(.black)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)
                .frame(height: 40)
                .background(Color.white)
                .cornerRadius(20)
            Spacer()
            Text(">")
        }
    }
}

struct MoneySavedView: View {
    var body: some View {
        Text("Money Saved View")
    }
}

struct YourOrdersView: View {
    var body: some View {
        Text("Your Orders View")
    }
}

struct CO2ESavedView: View {
    var body: some View {
        Text("CO2E Saved View")
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings View")
    }
    
    
}


struct StoreLoginView: View {
    var body: some View {
        Text("Store Login View")
    }
}

struct HelpCenterView: View {
    var body: some View {
        Text("Help Center View")
    }
}

struct LegalView: View {
    var body: some View {
        Text("Legal View")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
