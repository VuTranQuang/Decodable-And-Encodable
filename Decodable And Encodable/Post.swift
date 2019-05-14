//
//  Post.swift
//  Decodable And Encodable
//
//  Created by Vu on 5/14/19.
//  Copyright © 2019 Vu. All rights reserved.
//

import Foundation


struct Post: Encodable, Decodable {
    let body: String
    let id: Int
    let title: String
    let userId: Int
    
}
