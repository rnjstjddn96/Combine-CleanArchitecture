// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let classList = try? newJSONDecoder().decode(ClassList.self, from: jsonData)

import Foundation

// MARK: - ClassListElement
struct ClassListElement: Codable {
    let title, category, ownerID: String
    let price: Int
    let classInfo, status: String
    let isVisible, isBest: Bool
    let successPoint: Int
    let subTitle: String
    let totalRunningTime: Int
    let tags: [String]
    let sections: [Section]
    let created, updated, id: String
    let bannerImages: [BannerImage]
    let bannerTitle, name: String
    let review: Review

    enum CodingKeys: String, CodingKey {
        case title, category
        case ownerID = "ownerId"
        case price, classInfo, status, isVisible, isBest, successPoint, subTitle, totalRunningTime, tags, sections, created, updated, id, bannerImages, bannerTitle, name, review
    }
}

// MARK: - BannerImage
struct BannerImage: Codable {
    let uid: String
    let lastModified: Int
    let lastModifiedDate, name: String
    let size: Int
    let type: String
    let percent: Int
    let originFileObj: OriginFileObj
    let thumbURL: String

    enum CodingKeys: String, CodingKey {
        case uid, lastModified, lastModifiedDate, name, size, type, percent, originFileObj
        case thumbURL = "thumbUrl"
    }
}

// MARK: - OriginFileObj
struct OriginFileObj: Codable {
    let uid: String
}

enum Review: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Review.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Review"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
    
    func get() -> Float {
        switch self {
        case .integer(let val):
            return Float(val)
        case .string(let val):
            return Float(val) ?? 0.0
        }
    }
}

// MARK: - Section
struct Section: Codable {
    let title: String
    let key: Int
    let status, filename: String
    let fileIDS: [String]?
    let video: Video?

    enum CodingKeys: String, CodingKey {
        case title, key, status, filename
        case fileIDS = "fileIds"
        case video
    }
}

// MARK: - Video
struct Video: Codable {
    let url: String
    let verifyContent: String

    enum CodingKeys: String, CodingKey {
        case url
        case verifyContent = "verify_content"
    }
}

typealias ClassList = [ClassListElement]
