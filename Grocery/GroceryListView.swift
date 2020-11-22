//
//  GroceryListView.swift
//  Grocery
//
//  Created by slava bily on 19.11.2020.
//

import SwiftUI

struct GroceryListView: View {
    
    @EnvironmentObject var groceryItems: GroceryItems
    
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
}

struct GroceryListView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryListView()
    }
}
