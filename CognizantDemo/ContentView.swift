//
//  ContentView.swift
//  CognizantDemo
//
//  Created by Jalp on 15/04/2021.
//

import SwiftUI


struct ContentView: View {
    // Observe the session class of any changes
    @StateObject var session = Session()
    var body: some View {
        // If the user is authenticated show them the list view else login screen
        if session.authenticated {
            ListView()
        } else {
            // Inject the current session class as an environment variable
            LoginView()
                .environmentObject(self.session)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
