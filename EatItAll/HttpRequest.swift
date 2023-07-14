//
//  HttpRequest.swift
//  EatItAll
//
//  Created by 王文杰 on 7/9/23.
//

import Foundation

class HTTPClient {
    let domain = "https://wenjie98.pythonanywhere.com"
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
}
