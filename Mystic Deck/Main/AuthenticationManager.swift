////
////  AuthenticationManager.swift
////  Mystic Deck
////
////  Created by Hitarth Rathod on 24/03/24.
////
//
//import Foundation
//import FirebaseAuth
//struct AuthDataResultModel {
//    let uid: String
//    let email: String?
//    let photourl: String?
//    init(user: User) {
//        self.uid = user.uid
//        self.email = user.email
//        self.photourl = user.photoURL?.absoluteString
//        
//        
//    }
//}
//final class AuthenticationManager{
//    static let shared = AuthenticationManager()
//    private init(){
//    }
//    
//    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
//        let authDataResult = try await Auth.auth().createUser(withEmail: <#T##String#>, password: <#T##String#>)
//        return AuthDataResultModel(user: authDataResult.user)
//    }
//}
