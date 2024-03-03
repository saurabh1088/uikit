//
//  OpenLibraryAuthors.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 03/03/24.
//

import Foundation

struct OpenLibraryAuthors: Codable {
    var name: String
    var personalName: String
    var deathDate: String
    var alternateNames: [String]
    var key: String
    var birthDate: String
    var type: OpenLibraryAuthorType
    var remoteIds: OpenLibraryAuthorRemoteIDs
    var photos: [Int]
    var bio: TypeValuePair
    var latestRevision: Int
    var revision: Int
    var created: TypeValuePair
    var lastModified: TypeValuePair
    
    enum CodingKeys: String, CodingKey {
        case name, key, type, photos, bio, revision, created
        case personalName = "personal_name"
        case deathDate = "death_date"
        case alternateNames = "alternate_names"
        case birthDate = "birth_date"
        case remoteIds = "remote_ids"
        case latestRevision = "latest_revision"
        case lastModified = "last_modified"
    }
}

struct OpenLibraryAuthorType: Codable {
    var key: String
}

struct OpenLibraryAuthorRemoteIDs: Codable {
    var wikidata: String
    var isni: String
    var viaf: String
}

struct TypeValuePair: Codable {
    var type: String
    var value: String
}
