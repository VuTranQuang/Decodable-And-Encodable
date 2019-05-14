//
//  ViewController.swift
//  Decodable And Encodable
//
//  Created by Vu on 5/14/19.
//  Copyright © 2019 Vu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onClickGetButton(_ sender: UIButton) {
        // TODO: Encodable bassic user JSONSerialization  {
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        let postDictionary = [ "userId": "55",
//                               "id" : "126",
//                               "title" : "Hey there",
//                               "body" : "What are you doing"]
//        do {
//            let jsonBody = try JSONSerialization.data(withJSONObject: postDictionary, options: [])
//            request.httpBody = jsonBody
//        } catch {}
//        let session = URLSession.shared
//        let task = session.dataTask(with: request) { (data, _, _) in
//            guard let data = data else { return}
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print(json)
//            } catch {}
//        }
//        task.resume()
        //}
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let newPost = Post(body: "This is sexy girl", id: 127, title: "Encoding Stuff", userId: 55)
        do {
            let jsonBody = try JSONEncoder().encode(newPost)
            request.httpBody = jsonBody
        } catch {}
        let session = URLSession.shared
                let task = session.dataTask(with: request) { (data, _, _) in
                    guard let data = data else { return}
                    do {
//                        let json = try JSONSerialization.jsonObject(with: data, options: [])
//                        print(json)
                        let sendPost = try JSONDecoder().decode(Post.self, from: data)
                        print(sendPost)
                    } catch {}
               }
                task.resume()
    }
    
    @IBAction func onClickSendButton(_ sender: UIButton) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) {(data, _, _) in
            guard let data = data else { return}
            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print(json)
                let users = try JSONDecoder().decode([User].self, from: data)
//                print(user)
                for user in users {
                    print(user.address.geo.lat)
                }
                
            } catch {}
        }
        task.resume()
        
    }
}

