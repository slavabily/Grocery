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
                    Button("Cancel") {
                        
                        presentationMode.wrappedValue.dismiss()
                    }
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
