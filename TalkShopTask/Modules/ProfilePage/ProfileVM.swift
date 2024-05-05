//
//  ProfileVM.swift
//  TalkShopTask
//
//  Created by VS on 05/05/24.
//

import Foundation

class ProfileVM : ObservableObject{
    @Published var profileData : ProfileData?

    func callProfileAPI(){
        let networkService = NetworkService()
        networkService.fetchData(jsonFile: "profile") {  (result: Result<ProfileModel, Error>) in
            switch result {
            case .success(let model):
                self.profileData = model.data
            case .failure(let err) :
                print(err)
            }
        }
    }
}
