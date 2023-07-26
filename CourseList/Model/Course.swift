//
//  Course.swift
//  CourseList
//
//  Created by mai nguyen on 7/21/23.
//

import Foundation

struct Course: Codable {
    let id: Int
    let name: String
    let link, imageURL: String
    let numberOfLessons: Int

    enum CodingKeys: String, CodingKey {
        case id, name, link
        case imageURL = "imageUrl"
        case numberOfLessons
    }
}

typealias course = [Course]

