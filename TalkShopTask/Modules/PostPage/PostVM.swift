//
//  PostVM.swift
//  TalkShopTask
//
//  Created by VS on 05/05/24.
//

import Foundation

class PostVM : ObservableObject {
    @Published var postData : ProfileModel?

    func callPostAPI(){
        let networkService = NetworkService()
        networkService.fetchData(jsonFile: "profile") {  (result: Result<ProfileModel, Error>) in
            switch result {
            case .success(let model):
                self.postData = model
            case .failure(let err) :
                print(err)
            }
        }
    }
}
