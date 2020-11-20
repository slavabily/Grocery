//
//  LoginView.swift
//  Grocery
//
//  Created by slava bily on 19.11.2020.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        Button {
            settings.loggedIn = true
        } label: {
            HStack {
                Text("Log In")
            }
            .padding()
            .frame(width: 100, height: 40)
            .foregroundColor(Color.white)
            .background(Color.blue)
            .cornerRadius(5)
        }
        .padding(.bottom, 40)

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
