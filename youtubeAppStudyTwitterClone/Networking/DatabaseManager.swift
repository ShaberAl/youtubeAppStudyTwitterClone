//
//  DatabaseManager.swift
//  youtubeAppStudyTwitterClone
//
//  Created by MacOS on 24.11.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestoreCombineSwift
import Combine

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    let db = Firestore.firestore()
    let usersPath: String = "users"
    
    func collectionUsers(add user: User) -> AnyPublisher<Bool, Error> {
        let twitterUser = TwitterUser(from: user)
        return db.collection(usersPath).document(twitterUser.id).setData(from: twitterUser)
            .map { _ in
                return true
            }
            .eraseToAnyPublisher()
    }
    
    func collectionUsers(retrieve id: String) -> AnyPublisher<TwitterUser, Error> {
        db.collection(usersPath).document(id).getDocument()
            .tryMap {
                try $0.data(as: TwitterUser.self)
            }
            .eraseToAnyPublisher()
    }
}
