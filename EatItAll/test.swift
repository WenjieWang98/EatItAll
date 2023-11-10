//
//  test.swift
//  EatItAll
//
//  Created by 王文杰 on 10/22/23.
//

import SwiftUI

struct test: View {
    @State private var isLoggedIn = false // 使用@State来跟踪登录状态

        var body: some View {
            NavigationView {
                VStack {
                    Text("Login View")

                    Button("Login") {
                        // 在此处执行登录操作
                        isLoggedIn = true // 设置为true以模拟成功的登录
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)

                    // 使用NavigationLink，当isLoggedIn为true时，自动跳转到主界面
                    NavigationLink("", destination: Main2View(), isActive: $isLoggedIn)
                        .opacity(0)
                }
            }
        }
    }

    struct Main2View: View {
        var body: some View {
            Text("Main View")
                .navigationBarTitle("Welcome", displayMode: .inline)
        }
    }

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
