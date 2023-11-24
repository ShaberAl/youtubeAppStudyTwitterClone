//
//  AuthManager.swift
//  youtubeAppStudyTwitterClone
//
//  Created by MacOS on 24.11.2023.
//

import Foundation
import Firebase
import FirebaseAuthCombineSwift
import Combine

class AuthManager {
    
    static let shared = AuthManager()
    
    func registerUser(with email: String, password: String) -> AnyPublisher<User, Error> {
        Auth.auth().createUser(withEmail: email, password: password)
            .map(\.user)
            .eraseToAnyPublisher()
    }
    
    func loginUser(with email: String, password: String) -> AnyPublisher<User, Error> {
        Auth.auth().signIn(withEmail: email, password: password)
            .map(\.user)
            .eraseToAnyPublisher()
    }
}
