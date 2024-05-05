//
//  PostPage.swift
//  TalkShopTask
//
//  Created by VS on 05/05/24.
//

import SwiftUI

struct PostPage: View {
    let row : FeedData
    @ObservedObject private var postVM = PostVM()

    var body: some View {
        VStack {
            HStack {
                Spacer()
                profileView()
            }
            .padding()
            videoCard()
                .padding()
                .onAppear {
                    postVM.callPostAPI()
                }
            Spacer()
        }
        .navigationTitle("Post Detail Page")
    }
    
    private func profileView() -> some View {
        VStack {
            NavigationLink(destination: ProfilePage(row: row)) {
                AsyncImage(url: URL(string: row.profilePictureUrl ?? "")) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 40,height: 40)
                .cornerRadius(22)
            }
            Text(row.username ?? "")
        }
    }
    
    private  func videoCard() -> some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.black)
            .overlay {
                VStack {
                    asnycImage(row: row)
                    videoData(row: row)
                }
            }
            .frame( height: 170)
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
            AsyncImage(url: URL(string: row.profilePictureUrl ?? "")) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 25,height: 25)
            .cornerRadius(12.5)
            Text(row.username ?? "")
                .foregroundColor(.gray)
            Spacer()
            Text("Likes: \(row.likes ?? 0)")
                .foregroundColor(.gray)
        }
        .padding(.leading,25)
        .padding(.trailing,25)
        .padding(.bottom,25)
    }
}
