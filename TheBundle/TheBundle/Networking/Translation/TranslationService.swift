//
//  TranslationService.swift
//  TheBundle
//
//  Created by Mickael PAYAN on 03/05/2021.
//
//  swiftlint:disable line_length

import Foundation

final class TranslationService {

    private let apiService: Networking
    private let endPoint = "https://translation.googleapis.com/language/translate/v2?"

    init(apiService: Networking = .init()) {
        self.apiService = apiService
    }

    func getTranslation(text: String, _ completion: @escaping (Result<Translation, Networking.APIError>) -> Void) {
        apiService.getJSON(urlString: "\(endPoint)key=\(APIConfiguration.translationKey)&target=en&q=\(text)") { (result: Result<Translation, Networking.APIError>) in
            switch result {
            case .success(let translation):
                completion(.success(translation))
            case .failure(let apiError):
                completion(.failure(apiError))
            }
        }
    }
}
