//
//  FriendsView.swift
//  CameraApp
//
//  Created by Juuso on 21.2.2020.
//  Copyright © 2020 Juuso. All rights reserved.
//

import SwiftUI

struct Friend: Identifiable {
    var id:UUID = UUID()
    var name:String
    var mutualFriends:Int
    var avatar:String
    var poster: String
}

var friends:[Friend] = [
    Friend(name: "Kristina D.", mutualFriends: 350, avatar: "cristina", poster: "alps"),
    Friend(name: "David G.", mutualFriends: 1, avatar: "david", poster: "sanfransisco"),
    Friend(name: "Robert B.", mutualFriends: 22, avatar: "robert", poster: "london"),
    Friend(name: "Ruxi A.", mutualFriends: 10, avatar: "ruxi", poster: "paris"),
    Friend(name: "George B.", mutualFriends: 2, avatar: "george", poster: "newyork"),
]
struct FriendsView: View {
    
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(friends, id: \.id) { friend in
                    FriendRow(friend: friend).padding()
                }.navigationBarTitle("Friends")
            }
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}

