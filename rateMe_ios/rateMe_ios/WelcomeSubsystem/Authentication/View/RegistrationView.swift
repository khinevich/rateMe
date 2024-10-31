//
//  RegistrationView.swift
//  rateMe_ios
//
//  Created by Mikhail Khinevich on 14.08.24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var fullname = ""
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var confirmedPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack{
                HStack{
                    Text("LET'S BE FRIENDS!")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 80))
                        .bold()
                        .multilineTextAlignment(.leading)
                }
                VStack (spacing: 10) {
                    InputFieldView(inputText: $email,
                                   inpuTextFieldTitle: "Email or Username",
                                   inputTextPlaceholder: "Enter your email or username",
                                   isSecureField: false)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    InputFieldView(inputText: $fullname,
                                   inpuTextFieldTitle: "Full Name",
                                   inputTextPlaceholder: "Enter your Name",
                                   isSecureField: false)
                    InputFieldView(inputText: $username,
                                   inpuTextFieldTitle: "Username",
                                   inputTextPlaceholder: "Enter your username",
                                   isSecureField: false)
                    
                    InputFieldView(inputText: $password,
                                   inpuTextFieldTitle: "Password",
                                   inputTextPlaceholder: "Enter your password",
                                   isSecureField: true)
                    InputFieldView(inputText: $confirmedPassword,
                                   inpuTextFieldTitle: "Repeat Password",
                                   inputTextPlaceholder: "Confirm your password",
                                   isSecureField: true)
                }
                .padding(10)
                Button(action: {
                    print("Sign user up")
                    Task {
                        try await viewModel.createUser(withEmail: email,
                                                       password: password,
                                                       fullname: fullname)
                    }
                }, label: {
                    HStack {
                        Text("SIGN UP")
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(Color.black)
                    .frame(width: UIScreen.main.bounds.width-32, height: 48)
                })
                .background(Color("PinkText"))
                .cornerRadius(10)
                Spacer()
                Button{
                    dismiss()
                } label: {
                    HStack (spacing: 20) {
                        Text("Already have an account?")
                        Text("SIGN IN")
                            .fontWeight(.bold)
                    }
                    .foregroundStyle(Color("PinkText"))
                    .font(.system(size: 14))
                }
            }
            .background(Color.black.ignoresSafeArea())
        }
    }
}

#Preview {
    RegistrationView()
        .environmentObject(AuthViewModel())
}

