//
//  SignupNewUserView.swift
//  Grocery
//
//  Created by slava bily on 24.11.2020.
//

import SwiftUI
import Firebase

struct SignupNewUserView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var groceryitems: GroceryItems
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Register")) {
                    TextField("Enter your email", text: $email)
                    SecureField("Enter your password", text: $password)
                }
                Section {
                    Button("Save") {
                        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                            if error == nil {
                                Auth.auth().signIn(withEmail: email, password: password)
                            }
                        }
                        presentationMode.wrappedValue.dismiss()
                    }
                    .frame(width: 300, height: 40)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(5)
                    Button("Cancel") {
                        
                        presentationMode.wrappedValue.dismiss()
                    }
                    .frame(width: 300, height: 40)
                    .foregroundColor(Color.white)
                    .background(Color.red)
                    .cornerRadius(5)
                }
            }
            .navigationBarTitle("Register")
        }  
    }
}

struct SignupNewUserView_Previews: PreviewProvider {
    static var previews: some View {
        SignupNewUserView()
    }
}
