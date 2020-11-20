//
//  OnlineUsersView.swift
//  Grocery
//
//  Created by slava bily on 19.11.2020.
//

import SwiftUI

struct OnlineUsersView: View {
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Online Users")
                Button {
                    settings.loggedIn = false
                } label: {
                    HStack {
                        Text("Log Out")
                    }
                    .padding()
                    .frame(width: 100, height: 40)
                    .foregroundColor(Color.white)
                    .background(Color.red)
                    .cornerRadius(5)
                }
                .padding(.bottom, 40)
            }
            .navigationBarTitle(Text("Online"), displayMode: .inline)
        }
        
        
    }
}

struct OnlineUsersView_Previews: PreviewProvider {
    static var previews: some View {
        OnlineUsersView()
    }
}
