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

extension OpenLibraryAuthors: CustomStringConvertible {
    var description: String {
        var descriptionString = """
        Name: \(name)
        Personal Name: \(personalName)
        Birth Date: \(birthDate)
        Death Date: \(deathDate)
        Alternate Names: \(alternateNames.joined(separator: ", "))
        Key: \(key)
        Type: \(type.key)
        Remote IDs: [Wikidata: \(remoteIds.wikidata), ISNI: \(remoteIds.isni), VIAF: \(remoteIds.viaf)]
        Photos: \(photos.map { String($0) }.joined(separator: ", "))
        Bio: \(bio.value)
        Latest Revision: \(latestRevision)
        Revision: \(revision)
        Created: \(created.value)
        Last Modified: \(lastModified.value)
        """
        return descriptionString
    }
}
