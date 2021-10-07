//
//  WeatherService.swift
//  TheBundle
//
//  Created by Mickael PAYAN on 28/05/2021.
//
// swiftlint:disable identifier_name
// swiftlint:disable line_length

import Foundation

struct WeatherService {

    private let apiService: Networking
    private let endPoint = "http://api.openweathermap.org/data/2.5/weather?"

    init(apiService: Networking = .init()) {
        self.apiService = apiService
    }

    func getWeather(city id: Int,
                    completion: @escaping (Result<APIWeather, Networking.APIError>) -> Void) {
        apiService.getJSON(urlString: "\(endPoint)id=\(id)&appid=\(APIConfiguration.weatherKey)") { (result: Result<APIWeather, Networking.APIError>) in
            switch result {
            case .success(let weather):
                completion(.success(weather))
            case .failure(let apiError):
                completion(.failure(apiError))
            }
        }
    }
}
