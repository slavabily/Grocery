//
//  TabbarView.swift
//  Grocery
//
//  Created by slava bily on 19.11.2020.
//

import SwiftUI
import Firebase

struct TabbarView: View {
    
    @EnvironmentObject var settings: UserSettings
    
    let usersRef = Database.database().reference(withPath: "online")
    
    @State private var onlineUsersCount = ""
    
    var body: some View {
        
        TabView {
            GroceryListView()
                .tabItem {
                    Text("Grocery List")
                }
            
            OnlineUsersView()
                .tabItem {
                    Text("Online \(onlineUsersCount)")
                }
                .onAppear(perform: {
                    usersRef.observe(.value) { (snapshot) in
                        if snapshot.exists() {
                            onlineUsersCount = snapshot.childrenCount.description
                        } else {
                            onlineUsersCount = "0"
                        }
                    }
                })
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
