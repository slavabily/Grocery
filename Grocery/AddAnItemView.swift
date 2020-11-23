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
        let user = User(uid: "FakeId", email: "hungry@person.food")
        
        let groceryItem = GroceryItem(name: name, addedByUser: user.email, completed: false)
        
        let text = name.lowercased()
        
        let groceryItemRef = ref.child(text)
        
        groceryItemRef.setValue(groceryItem.toAnyObject())
        
//        groceryItems.items.append(groceryItem)
        
    }
}

struct AddAnItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddAnItemView()
    }
}
