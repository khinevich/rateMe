//
//  MainView.swift
//  rateMe_ios
//
//  Created by Mikhail Khinevich on 17.08.24.
//

import SwiftUI

struct MainView: View {
    //@EnvironmentObject var viewModel: AuthViewModel
    @Environment(AuthViewModel.self) private var authViewModel
    @State private var selection = 1
    var body: some View {
        TabView (selection: $selection){
            FeedView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                }
            RatingView()
                .tabItem {
                    Image(systemName: "plus")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }
                .tag(1)
                .environment(authViewModel)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .accentColor(Color.pinkText)
    }
}

#Preview {
    //MainView()
        //.environment(AuthViewModel())
}
