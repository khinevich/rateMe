//
//  AuthViewModel.swift
//  rateMe_ios
//
//  Created by Mikhail Khinevich on 15.08.24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

@MainActor
@Observable class AuthViewModel: ObservableObject {
    var userSession: FirebaseAuth.User? //whether or not user is logged in. Firebase user object
    var currentUser: User? //out user that we created in model
    
    init() {
        self.userSession = Auth.auth().currentUser //functionality from firebase
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        print("Sign in from authviewmodel")
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        print("Create user from authviewmodel")
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password) //creating user with firebase and store it
            self.userSession = result.user // user object
            let user = User(id: result.user.uid, fullname: fullname, email: email) //creating our user object
            let encodedUser = try Firestore.Encoder().encode(user) //encode that object
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser) //upload data to firestore
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    func singOut(){
        print("Sign out from authviewmodel")
        do {
            try Auth.auth().signOut() //signs out user on backend
            self.userSession = nil //wipes out user session and takes us back to login screen
            self.currentUser = nil //wipes out current user data model
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    func deleteAccount() {
        print("Delete account from authviewmodel")
    }
    func fetchUser() async {  //fetching data from DB to our app
        print("Fetch user from authviewmodel")
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
        print("DEBUG: Current user is \(self.currentUser)")
    }
}
