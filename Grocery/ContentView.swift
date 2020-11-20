//
//  ContentView.swift
//  Grocery
//
//  Created by slava bily on 17.11.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingLoginView = false
 
    var body: some View {
        NavigationView {
            VStack {
                Button("Login") {
                    showingLoginView = true
                }
                
                NavigationLink(destination: LoginView(), isActive: $showingLoginView) {
                    EmptyView()
                }
            }
            .navigationBarTitle("Grocery")
            
        }
        
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
