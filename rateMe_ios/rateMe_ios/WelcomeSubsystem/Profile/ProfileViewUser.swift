//
//  ProfileViewUser.swift
//  rateMe_ios
//
//  Created by Mikhail Khinevich on 16.08.24.
//

import SwiftUI

struct ProfileViewUser: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser {
            HStack {
                // Profile Picture Placeholder
                Text (user.initials)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 80, height: 100)
                    .background(Color.gray.opacity(0.3))
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                
                // Name and Username
                VStack(alignment: .leading, spacing: 10) {
                    Text(user.fullname)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text (user.email)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 10)
                
                Spacer()
                
                VStack {
                    Button {
                        print("Signing out")
                        viewModel.singOut()
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.forward")
                            .imageScale(.large)
                            .tint(.red)
                    }
                }
            }
            .padding()
            .background(Color("GrayBackground"))
            .cornerRadius(15)
            .padding(.horizontal)
        } else {
            HStack {
                // Profile Picture Placeholder
                Text (User.MOCK_USER.initials)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 80, height: 100)
                    .background(Color.gray.opacity(0.3))
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                
                // Name and Username
                VStack(alignment: .leading, spacing: 10) {
                    Text(User.MOCK_USER.fullname)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text (User.MOCK_USER.email)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 10)
                
                Spacer()
                
                VStack {
                    Button {
                        print("Signing out")
                        viewModel.singOut()
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.forward")
                            .imageScale(.large)
                            .tint(.red)
                    }
                }
            }
            .padding()
            .background(Color("GrayBackground"))
            .cornerRadius(15)
            .padding(.horizontal)
        }
    }
}

#Preview {
    ProfileViewUser()
        .environmentObject(AuthViewModel())
}
