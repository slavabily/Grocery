//
//  OnlineUsers.swift
//  Grocery
//
//  Created by slava bily on 22.11.2020.
//

import Foundation
import Combine

class OnlineUsers: ObservableObject {
    @Published var users = [String]()
}
