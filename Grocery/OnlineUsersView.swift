//
//  OnlineUsersView.swift
//  Grocery
//
//  Created by slava bily on 19.11.2020.
//

import SwiftUI
import Firebase

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
                
                let user = Auth.auth().currentUser!
                
                let onlineRef = Database.database().reference(withPath: "online/\(user.uid)")
                
                onlineRef.removeValue { (error, _) in
                    if let error = error {
                        print("Removing online failed \(error)")
                        return
                    }
//                    do {
//                        try Auth.auth().signOut()
//                        
//                    } catch (let error) {
//                        print("Auth sign out failed: \(error)")
//                    }
                    settings.loggedIn = false
                }
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
