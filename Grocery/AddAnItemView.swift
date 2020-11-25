//
//  AddAnItemView.swift
//  Grocery
//
//  Created by slava bily on 20.11.2020.
//

import SwiftUI
import Firebase

struct AddAnItemView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var groceryItems: GroceryItems
    
    @State private var name = ""
 
    let ref = Database.database().reference(withPath: "grocery-items")
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add an Item"), content: {
                    TextField("Item name", text: $name )
                    Button("Save") {
                        save()
                        presentationMode.wrappedValue.dismiss()
                    }
                })
            }
            .navigationBarTitle("Grocery Item")
        }     
    }
    
    func save() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            guard let user = user else { return }
            
            let u = User(authData: user)
            
            let groceryItem = GroceryItem(name: name, addedByUser: u.email, completed: false)
            
            let text = name.lowercased()
            
            let groceryItemRef = ref.child(text)
            
            groceryItemRef.setValue(groceryItem.toAnyObject())
        }
        
        
        
    }
}

struct AddAnItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddAnItemView()
    }
}
