//
//  ProfileModel.swift
//  TalkShopTask
//
//  Created by VS on 05/05/24.
//

import Foundation

struct ProfileModel : Decodable {
    let status : String
    let data : ProfileData
}

struct ProfileData : Decodable {
    let username : String
    let profilePictureUrl : String
    let posts : [FeedData]
}
