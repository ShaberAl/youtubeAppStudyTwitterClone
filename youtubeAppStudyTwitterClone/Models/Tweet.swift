//
//  Tweet.swift
//  youtubeAppStudyTwitterClone
//
//  Created by MacOS on 25.11.2023.
//

import Foundation

struct Tweet: Codable, Identifiable {
    var id = UUID().uuidString
    let author: TwitterUser
    let authorID: String
    let tweetContent: String
    var likeCount: Int
    var likers: [String]
    let isReply: Bool
    let parentReference: String?
}
