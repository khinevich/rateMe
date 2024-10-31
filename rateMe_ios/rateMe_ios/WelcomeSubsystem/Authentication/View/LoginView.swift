//
//  LoginView.swift
//  rateMe_ios
//
//  Created by Mikhail Khinevich on 10.04.24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    //@EnvironmentObject var viewModel: AuthViewModel
    @Environment(AuthViewModel.self) private var authViewModel
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 30){
                HStack{
                    Text("Hello!")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 100))
                        .bold()
                    Spacer()
                }.padding()
                VStack{
                    HStack{
                        Text("Welcome to the")
                            .foregroundStyle(Color.white)
                        Text("RateMe")
                            .foregroundStyle(Color("PinkText"))
                        Text("app!")
                            .foregroundStyle(Color.white)
                        Spacer()
                    }.padding(.horizontal)
                    HStack{
                        Text("Have we met you before?")
                            .foregroundStyle(Color.white)
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                Spacer()
                HStack{
                    Text("YES!")
                        .bold()
                        .foregroundStyle(Color.white)
                    Spacer()
                }.padding()
                VStack (spacing: 10) {
                    InputFieldView(inputText: $email,
                                   inpuTextFieldTitle: "Email or Username",
                                   inputTextPlaceholder: "Enter your email or username",
                                   isSecureField: false)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    InputFieldView(inputText: $password,
                                   inpuTextFieldTitle: "Password",
                                   inputTextPlaceholder: "Enter your password",
                                   isSecureField: true)
                }
                .padding(10)
                Button(action: {
                    print("Signing in")
                    Task {
                        try await authViewModel.signIn(withEmail: email, password: password)
                    }
                }, label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(Color.black)
                    .frame(width: UIScreen.main.bounds.width-32, height: 48)
                })
                .background(Color("PinkText"))
                .cornerRadius(10)
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack (spacing: 20) {
                        Text("YOU ARE NEW?")
                        Text("SIGN UP")
                            .fontWeight(.bold)
                    }
                    .foregroundStyle(Color("PinkText"))
                    .frame(width: UIScreen.main.bounds.width-32, height: 48)
                    .border(Color.pinkText)
                }
                //.background(Color("PinkText"))
                //.cornerRadius(10)
                
            }
            .background(Color.black.ignoresSafeArea())
        }
    }
}

#Preview { 
    //LoginView()
    //    .environmentObject(AuthViewModel())
}
