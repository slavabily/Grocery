//
//  GroceryListView.swift
//  Grocery
//
//  Created by slava bily on 19.11.2020.
//

import SwiftUI
import Firebase

struct GroceryListView: View {
    
    @EnvironmentObject var groceryItems: GroceryItems
    
    let ref = Database.database().reference(withPath: "grocery-items")
    
    var user = User(uid: "FakeID", email: "hungry@person.food")
    
    @State private var showingAddAnItemScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(groceryItems.items, id: \.self) { item in
                    VStack(alignment: .leading) {
                        Text(item.name)
                        Text(user.email)
                            .font(.footnote)
                    }
                    
                }
                .onDelete(perform: deleteItems(at:))
                
            }
            .onAppear {
                loadItems()
            }
            .navigationBarTitle(Text("Grocery List"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                showingAddAnItemScreen.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showingAddAnItemScreen) {
                AddAnItemView().environmentObject(groceryItems)
            }
        } 
    }
    
    func deleteItems(at offsets: IndexSet) {
        for offset in offsets {
            let groceryItem = groceryItems.items[offset]
            
            groceryItem.ref?.removeValue()
        }
    }
    
    func loadItems() {
        ref.observe(.value) { (snapshot) in
            var newItems = [GroceryItem]()
            
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot, let groceryItem = GroceryItem(snapshot: snapshot) {
                    newItems.append(groceryItem)
                }
            }
            groceryItems.items = newItems
        }
    }
}

struct GroceryListView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryListView()
    }
}
