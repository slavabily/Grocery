//
//  StartView.swift
//  Grocery
//
//  Created by slava bily on 19.11.2020.
//

import SwiftUI

struct StartView: View {
    
    @EnvironmentObject var settings: UserSettings
    @EnvironmentObject var groceryItems: GroceryItems
    
    var body: some View {
        if settings.loggedIn {
            return AnyView(TabbarView())
        } else {
            return AnyView(LoginView())
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
