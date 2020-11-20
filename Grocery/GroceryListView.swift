//
//  GroceryListView.swift
//  Grocery
//
//  Created by slava bily on 19.11.2020.
//

import SwiftUI

struct GroceryListView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Grocery List")
            }
            .navigationBarTitle(Text("Grocery List"), displayMode: .inline)
        }
        
    }
}

struct GroceryListView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryListView()
    }
}
