//
//  FeedVM.swift
//  TalkShopTask
//
//  Created by VS on 05/05/24.
//

import Foundation

class FeedVM : ObservableObject {
    @Published var feedData : [FeedData]?
    
    func callFeedAPI(){
        let networkService = NetworkService()
        networkService.fetchData(jsonFile: "feed") {  (result: Result<FeedModel, Error>) in
            switch result {
            case .success(let model):
                self.feedData = model.data
            case .failure(let err) :
                print(err)
            }
        }
    }
}
