//
//  DetectionService.swift
//  TheBundle
//
//  Created by Mickael PAYAN on 14/06/2021.
//
// swiftlint:disable line_length

import Foundation

final class DetectionService {

    private let apiService: Networking
    private let endPoint = "https://translation.googleapis.com/language/translate/v2/detect?"

    init(apiService: Networking = .init()) {
        self.apiService = apiService
    }

    func getDetection(text: String, _ completion: @escaping (Result<DetectionLanguage, Networking.APIError>) -> Void) {
        apiService.getJSON(urlString: "\(endPoint)key=\(APIConfiguration.translationKey)&q=\(text)") { (result: Result<DetectionLanguage, Networking.APIError>) in
            switch result {
            case .success(let detection):
                completion(.success(detection))
            case .failure(let apiError):
                completion(.failure(apiError))
            }
        }
    }
}
