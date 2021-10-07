//
//  ExchangeRate.swift
//  TheBundle
//
//  Created by Mickael PAYAN on 03/05/2021.
//
// swiftlint:disable line_length

import Foundation

final class ExchangeRateService {

    private let apiService: Networking
    private let endPoint = "http://data.fixer.io/api/latest?"

    init(apiService: Networking = .init()) {
        self.apiService = apiService
    }

    func getCurrency(_ completion: @escaping (Result<Currency, Networking.APIError>) -> Void) {
        apiService.getJSON(urlString: "\(endPoint)access_key=\(APIConfiguration.exchangeRateKey)") { (result: Result<Currency, Networking.APIError>) in
            switch result {
            case .success(let currency):
                completion(.success(currency))
            case .failure(let apiError):
                completion(.failure(apiError))
            }
        }
    }
}
