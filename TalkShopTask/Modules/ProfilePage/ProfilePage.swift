//
//  ProfilePage.swift
//  TalkShopTask
//
//  Created by VS on 05/05/24.
//

import SwiftUI

struct ProfilePage: View {
    @ObservedObject private var profileVM = ProfileVM()
    let row : FeedData

    var body: some View {
        VStack {
            HStack {
                profileView()
            }
            .padding()
            if let feedData = profileVM.profileData?.posts {
                List(feedData,id:\.postId) { row in
                    HStack {
                        videoCard(row: row)
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
        }
        .onAppear{
            profileVM.callProfileAPI()
        }
        .navigationTitle("Profile Page")
    }
    
    private func profileView() -> some View {
        VStack {
            AsyncImage(url: URL(string: row.profilePictureUrl ?? "")) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 100,height: 100)
            .cornerRadius(50)
            Text(row.username ?? "")
        }
    }
    
    private  func videoCard(row: FeedData) -> some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.black)
            .overlay {
                VStack {
                    asnycImage(row: row)
                    videoData(row: row)
                }
            }
            .frame( height: 170)
            .padding(.top,20)
    }
    
    //MARK: video Card image
    private  func asnycImage(row: FeedData) -> some View {
        AsyncImage(url: URL(string: row.thumbnail_url ?? "")) { image in
            image.resizable()
        } placeholder: {
            Color.gray
        }
        .frame( height: 150)
        .clipShape(.rect(cornerRadius: 25))
    }
    
    //MARK: video Card data likes and username
    private  func videoData(row: FeedData) -> some View {
        HStack {
            Spacer()
            Text("Likes: \(row.likes ?? 0)")
                .foregroundColor(.gray)
        }
        .padding(.leading,25)
        .padding(.trailing,25)
        .padding(.bottom,25)
    }
}
