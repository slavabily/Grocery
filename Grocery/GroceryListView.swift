//
//  GroceryListView.swift
//  Grocery
//
//  Created by slava bily on 19.11.2020.
//

import SwiftUI
import Firebase

struct MultiselectRow: View {
    
    var groceryItem: GroceryItem
    var email: String
    
    @State var completed = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(groceryItem.name)
                Text(email)
                    .font(.footnote)
            }
            .foregroundColor(completed ? .gray : .black)
            .onTapGesture {
                completed.toggle()
                groceryItem.ref?.updateChildValues(["completed": completed])
            }
            Spacer()
            
            if completed {
                Image(systemName: "checkmark")
                    .foregroundColor(.blue)
            }
        }
    }
}

struct GroceryListView: View {
    
    @EnvironmentObject var groceryItems: GroceryItems
    
    let ref = Database.database().reference(withPath: "grocery-items")
    
    @State var user = User(uid: "FakeID", email: "hungry@person.food")
    
    @State private var showingAddAnItemScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(groceryItems.items, id: \.self) { item in
                    MultiselectRow(groceryItem: item, email: user.email, completed: item.completed)
                    
                     
                }
                .onDelete(perform: deleteItems(at:))
                
            }
            .onAppear {
                loadItems()
                
                Auth.auth().addStateDidChangeListener { (auth, user) in
                    guard let user = user else { return }
                    
                    self.user = User(authData: user)
                }
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
        ref.queryOrdered(byChild: "completed").observe(.value) { (snapshot) in
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
