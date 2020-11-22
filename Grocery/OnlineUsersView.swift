//
//  OnlineUsersView.swift
//  Grocery
//
//  Created by slava bily on 19.11.2020.
//

import SwiftUI

struct OnlineUsersView: View {
    
    @EnvironmentObject var settings: UserSettings
    @EnvironmentObject var onlineUsers: OnlineUsers
    
    var body: some View {
        NavigationView {
            List {
                ForEach(onlineUsers.users, id:\.self) { user in
                    Text(user)
                }
            }
            .navigationBarTitle(Text("Online"), displayMode: .inline)
            .navigationBarItems(trailing: Button {
                settings.loggedIn = false
            } label: {   
                    Text("Sign Out")
            })
        }
    }
    
     
}

struct OnlineUsersView_Previews: PreviewProvider {
    static var previews: some View {
        OnlineUsersView()
    }
}
