//
//  rateMe_iosApp.swift
//  rateMe_ios
//
//  Created by Mikhail Khinevich on 10.04.24.
//

import SwiftUI
import Firebase
@main
struct rateMe_iosApp: App {
    
    @State private var authViewModel = AuthViewModel()
    
    init () {
        FirebaseApp.configure()
    }
    
    @State private var isImageActive = false
    @State private var isTextActive = false
    var body: some Scene {
        WindowGroup {
            if (isImageActive && isTextActive) {
                if authViewModel.userSession != nil {
                    MainView()
                        .environment(authViewModel)
                } else {
                    LoginView()
                        .environment(authViewModel)
                }
            } else if isTextActive{
                WelcomeImageView()
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            self.isImageActive = true
                        }
                    }
            } else {
                WelcomeTextView()
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            self.isTextActive = true
                        }
                    }
            }
        }
    }
}
