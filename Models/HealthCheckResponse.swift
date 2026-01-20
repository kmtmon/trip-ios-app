//
//  HealthCheckResponse.swift
//  trip-ios
//
//  Created by Kaung Myat Thet Mon on 1/18/26.
//

import Foundation

struct HealthCheckResponse: Codable {
    let status: String
    let timestamp: String
    let service: String
    let version: String
}
