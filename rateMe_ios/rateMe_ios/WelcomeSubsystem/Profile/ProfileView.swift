//
//  ProfileNewView.swift
//  rateMe_ios
//
//  Created by Mikhail Khinevich on 16.08.24.
//

import SwiftUI

struct ProfileView: View {
    //@EnvironmentObject var viewModel: AuthViewModel
    @Environment(AuthViewModel.self) private var authViewModel
    var body: some View {
        VStack {
            ProfileViewUser()
            ProfileViewRating()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
#Preview {
    //ProfileView()
    //    .environmentObject(AuthViewModel())
}

