//
//  GroceryItems.swift
//  Grocery
//
//  Created by slava bily on 22.11.2020.
//

import Foundation
import Combine

class GroceryItems: ObservableObject {
    @Published var items = [GroceryItem]()
}
