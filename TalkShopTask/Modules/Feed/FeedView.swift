//
//  FeedView.swift
//  TalkShopTask
//
//  Created by VS on 05/05/24.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject private var feedVM = FeedVM()
    
    var body: some View {
        
        NavigationStack {
            if let feedData = feedVM.feedData {
                List(feedData,id:\.postId) { row in
                    HStack {
                        NavigationLink(destination: PostPage(row: row)) {
                            videoCard(row: row)
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .listRowSpacing(10)
                .refreshable {
                    // call api to get the data
                    feedVM.callFeedAPI()
                }
            }
        }
        .onAppear {
            feedVM.callFeedAPI()
        }
    }
    
    //MARK: video Card
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
            .padding(.top,30)
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
