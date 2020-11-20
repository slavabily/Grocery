//
//  LoginView.swift
//  Grocery
//
//  Created by slava bily on 19.11.2020.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var settings: UserSettings
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        Text("Grocery")
            .font(.largeTitle)
            .bold()
            .padding(40)
        Form {
            TextField("Email", text: $email)
            TextField("Password", text: $password)
            
            Button {
                settings.loggedIn = true
            } label: {
                
                Text("Log In")
                    .frame(width: 300, height: 40)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(5)
            }
            Button(action: {}, label: {
                Text("Sign up")
                    .frame(width: 300, height: 40)
                    .foregroundColor(Color.white)
                    .background(Color.orange)
                    .cornerRadius(5)
            })
 
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
