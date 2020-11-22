//
//  AddAnItemView.swift
//  Grocery
//
//  Created by slava bily on 20.11.2020.
//

import SwiftUI

struct AddAnItemView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var groceryItems: GroceryItems
    
    let user = User(uid: "FakeId", email: "hungry@person.food")
    
    @State private var name = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add an Item"), content: {
                    TextField("Item name", text: $name )
                    Button("Save") {
                        let groceryItem = GroceryItem(name: name, addedByUser: user.email, completed: false)
                        groceryItems.items.append(groceryItem)
                        
                        presentationMode.wrappedValue.dismiss()
                    }
                })
            }
            .navigationBarTitle("Grocery Item")
        }     
    }
}

//struct AddAnItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddAnItemView()
//    }
//}
