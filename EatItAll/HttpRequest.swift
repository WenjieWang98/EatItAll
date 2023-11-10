//
//  HttpRequest.swift
//  EatItAll
//
//  Created by 王文杰 on 7/9/23.
//

import Foundation

class HTTPClient {
    let domain = "https://wfiqhbg0oa.execute-api.us-east-1.amazonaws.com/v1"
    func sendGetRequest(api: String, completion: @escaping (Data?, Error?) -> Void) {
        let urlString = domain + api
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            completion(data, error)
        }.resume()
    }
    
    func sendPostRequest(api: String, bodyData: Data, completion: @escaping (Data?, Error?) -> Void) {
        let urlString = domain + api
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = bodyData

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            completion(data, error)
        }.resume()
    }
    
    func sendEmptyPostRequest(api: String, completion: @escaping (Data?, Error?) -> Void) {
        let urlString = domain + api
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            // 在这里打印返回的结果
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    print("Response Data: \(responseString)")
                } else {
                    print("Response Data is not a valid UTF-8 string.")
                }
            } else {
                print("No data received.")
            }

            // 调用传入的 completion handler，将 data 和 error 返回
            completion(data, error)
        }.resume()
    }
}
