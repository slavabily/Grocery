//
//  LoginView.swift
//  Grocery
//
//  Created by slava bily on 19.11.2020.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @EnvironmentObject var settings: UserSettings
//    @EnvironmentObject var onlineUsers: OnlineUsers
    
    @State private var email = ""
    @State private var password = ""
    @State private var showingSignupNewUserView = false
    @State private var showingAlert = false
    
    @State private var alertMessage = ""
    
    var body: some View {
        Text("Grocery")
            .font(.largeTitle)
            .bold()
            .padding(40)
        Form {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            
            Button {
                guard email.count > 0, password.count > 0 else { return }

                Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                    if let error = error, user == nil {
                        alertMessage = error.localizedDescription
                        showingAlert = true
                    } else {
                        Auth.auth().addStateDidChangeListener { (auth, user) in
                            if user != nil {
                                settings.loggedIn.toggle()
                            }
                        }
                    }
                }
//                onlineUsers.users = ["hungry@person.food"]
            } label: {
                Text("Log In")
                    .frame(width: 300, height: 40)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(5)
            }
            Button(action: {
                showingSignupNewUserView.toggle()
            }, label: {
                Text("Sign up")
                    .frame(width: 300, height: 40)
                    .foregroundColor(Color.white)
                    .background(Color.orange)
                    .cornerRadius(5)
            })
        }
        .alert(isPresented: $showingAlert, content: {
            Alert(title: Text("Sign In Failed"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        })
        .sheet(isPresented: $showingSignupNewUserView) {
            SignupNewUserView()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
