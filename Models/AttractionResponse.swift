//
//  AttractionResponse.swift
//  trip-ios
//
//  Created by Kaung Myat Thet Mon on 1/18/26.
//

import Foundation

struct AttractionResponse: Codable, Identifiable {
    let id: UUID
    let name: String
    let description: String
    let lat: Double
    let lng: Double
    let category: String
    let rating: Double
    let visitDuration: String
    let bestTime: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case lat
        case lng
        case category
        case rating
        case visitDuration = "visit_duration"
        case bestTime = "best_time"
    }
    
    // Custom initializer for creating instances programmatically
    init(
        name: String,
        description: String,
        lat: Double,
        lng: Double,
        category: String,
        rating: Double,
        visitDuration: String,
        bestTime: String
    ) {
        self.id = UUID()
        self.name = name
        self.description = description
        self.lat = lat
        self.lng = lng
        self.category = category
        self.rating = rating
        self.visitDuration = visitDuration
        self.bestTime = bestTime
    }
    
    // Decoder initializer for Codable
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        self.lat = try container.decode(Double.self, forKey: .lat)
        self.lng = try container.decode(Double.self, forKey: .lng)
        self.category = try container.decode(String.self, forKey: .category)
        self.rating = try container.decode(Double.self, forKey: .rating)
        self.visitDuration = try container.decode(String.self, forKey: .visitDuration)
        self.bestTime = try container.decode(String.self, forKey: .bestTime)
    }
}
