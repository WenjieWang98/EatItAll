//
//  LoginView.swift
//  EatItAll
//
//  Created by 王文杰 on 10/22/23.
//

import SwiftUI

struct StartView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        if UserDefaults.standard.bool(forKey: "isLoggedIn"){
            MainView()
        }else{
            NavigationView {
                VStack {
                    Text("Let's get started \n    saving food!")
                        .font(.title)
                        .padding(.bottom, 20)
                        .foregroundColor(Color(.sRGB, red: 0, green: 0.5, blue: 0))
                    
                    Image("background") // 替换为您的图像资源名称
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .padding(.bottom, 20)
                    TextField("Username", text: $username)
                        .textContentType(.username)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    
                        .foregroundColor(.blue)
                        .font(.system(size: 16))
                    
                    SecureField("Password", text: $password)
                        .textContentType(.password)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    
                        .foregroundColor(.blue)
                        .font(.system(size: 16))
                    
                    NavigationLink(destination: MainView().navigationBarBackButtonHidden(true)) {
                        Text("Log In")
                            .font(.headline)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }.simultaneousGesture(TapGesture().onEnded{
                        login()
                    })
                    
                    NavigationLink(destination: registerView()) {
                        Text("Register")
                            .font(.headline)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color(.sRGB, red: 0, green: 0.5, blue: 0))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                }
                .padding()
            }.navigationBarBackButtonHidden(true)
        }
    }
    func login() {
        // 在这里实现登录逻辑，可以验证用户名和密码等
        //成功之后
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        isLoggedIn = true
    }
}

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isLoggedIn = false

    var body: some View {
        NavigationView {
            Form {
                Section() {
                    TextField("Username", text: $username)
                        .textContentType(.username)
                    SecureField("Password", text: $password)
                        .textContentType(.password)
                }
                NavigationLink(destination: MainView().navigationBarBackButtonHidden(true)){
                    Text("Log in").foregroundColor(.blue)
                }.simultaneousGesture(TapGesture().onEnded{
                    login()
                })
            }
            .navigationBarTitle("Login")
        }
    }

    func login() {
        // 在这里实现登录逻辑，可以验证用户名和密码等
        //成功之后
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        isLoggedIn = true
    }
}

struct registerView: View {
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        NavigationView {
            Form {
                Section() {
                    TextField("Username", text: $username)
                        .textContentType(.username)
                    SecureField("Password", text: $password)
                        .textContentType(.password)
                }

                Button(action: {
                    self.register()
                }) {
                    Text("Register")
                }
            }
            .navigationBarTitle("Register")
        }
    }

    func register() {
        // 在这里实现注册逻辑，可以验证用户名和密码等
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
