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
    
    let usersRef = Database.database().reference(withPath: "online")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(onlineUsers.users, id:\.self) { user in
                    Text(user)
                }
            }
            //Displaying a List of online users
            .onAppear(perform: {
                usersRef.observe(.childAdded) { (snap) in
                    guard let email = snap.value as? String else { return }
                    onlineUsers.users.append(email)
                }
                usersRef.observe(.childRemoved) { (snap) in
                    guard let emailToFind = snap.value as? String else { return }
                    for (index, email) in onlineUsers.users.enumerated() {
                        if email == emailToFind {
                            onlineUsers.users.remove(at: index)
                        }
                    }
                }
            })
            .navigationBarTitle(Text("Online"), displayMode: .inline)
            .navigationBarItems(trailing: Button {
                
                let user = Auth.auth().currentUser!
                let onlineRef = Database.database().reference(withPath: "online/\(user.uid)")
                onlineRef.removeValue { (error, _) in
                    if let error = error {
                        print("Removing online failed: \(error)")
                        return
                    }
                    do {
                        try Auth.auth().signOut()
                        settings.loggedIn = false
                    } catch (let error) {
                        print("Auth sign out failed: \(error)")
                    }
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
