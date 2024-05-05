//
//  FeedModel.swift
//  TalkShopTask
//
//  Created by VS on 05/05/24.
//

import Foundation

struct FeedModel : Decodable {
    let status : String
    let data : [FeedData]
}

struct FeedData : Decodable {
    let postId : String?
    let videoUrl : String?
    let thumbnail_url : String?
    let username : String?
    let likes : Int?
    let profilePictureUrl : String?
}
