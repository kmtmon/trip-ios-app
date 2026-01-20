//
//  APIService.swift
//  trip-ios
//
//  Created by Kaung Myat Thet Mon on 1/18/26.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    // Update this URL to match your backend server
    private let baseURL = "http://localhost:8000"
    
    private init() {}
    
    func checkHealth() async throws -> HealthCheckResponse {
        guard let url = URL(string: "\(baseURL)/health") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode(HealthCheckResponse.self, from: data)
    }
    
    func fetchAttractions(
        startDate: String? = nil,
        endDate: String? = nil,
        criteria: String? = nil,
        cities: String? = nil,
        provider: String? = nil,
        useAI: Bool = false
    ) async throws -> [AttractionResponse] {
        var components = URLComponents(string: "\(baseURL)/api/v1/attractions")
        var queryItems: [URLQueryItem] = []
        
        if let startDate = startDate {
            queryItems.append(URLQueryItem(name: "start_date", value: startDate))
        }
        if let endDate = endDate {
            queryItems.append(URLQueryItem(name: "end_date", value: endDate))
        }
        if let criteria = criteria {
            queryItems.append(URLQueryItem(name: "criteria", value: criteria))
        }
        if let cities = cities {
            queryItems.append(URLQueryItem(name: "cities", value: cities))
        }
        if let provider = provider {
            queryItems.append(URLQueryItem(name: "provider", value: provider))
        }
        queryItems.append(URLQueryItem(name: "use_ai", value: String(useAI)))
        
        components?.queryItems = queryItems.isEmpty ? nil : queryItems
        
        guard let url = components?.url else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode([AttractionResponse].self, from: data)
    }
}
