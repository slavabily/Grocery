//
//  TabbarView.swift
//  Grocery
//
//  Created by slava bily on 19.11.2020.
//

import SwiftUI

struct TabbarView: View {
    
    @EnvironmentObject var settings: UserSettings
    
    var onlineUsersCount = 1
    
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
            
        }
        
        
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
