//
//  APIService.swift
//  FStory
//
//  Created by Mainul Dip on 6/1/25.
//

import Foundation
import Combine

enum APIError: Error {
    case urlSessionError(String)
    case serverError(String = "Invalid API key")
    case invalidResponse(String = "Invalid Response from server")
    case decodingError(String = "Decoding Error, Error persing server response")
    case mapError(String)
    
}

protocol Service {
    func makeRequest<T: Codable> (with request: URLRequest, type: T.Type, completion: @escaping (T?, APIError?) -> Void)
}

class APIService: Service {
    func makeRequest<T: Codable>(with request: URLRequest, type: T.Type, completion: @escaping (T?, APIError?) -> Void) {
        //completion(nil, APIError.decodingError())
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(nil, .urlSessionError(error.localizedDescription))
                return
            }
            
            if let res = response as? HTTPURLResponse, res.statusCode > 299 {
                completion(nil, .serverError())
                return
            }
            
            guard let data = data else {
                completion(nil, .invalidResponse())
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(result, nil)
            } catch let err {
                print(err)
                completion(nil, .decodingError())
                return
            }
        }
        .resume()
    }
    
    func makeRequestPublisher<T: Codable>(with request: URLRequest?, type: T.Type) throws -> some Publisher<T, APIError> {
        guard let request = request else { throw APIError.serverError() }
        let mappedPublisher = URLSession.shared.dataTaskPublisher(for: request)
        let decodingPublisher = mappedPublisher.tryMap { (data: Data, response: URLResponse) in
            guard let response = response as? HTTPURLResponse, response.statusCode > 400 else {
                throw APIError.invalidResponse()
            }
            do {
                let decodeData = try JSONDecoder().decode(T.self, from: data)
                return decodeData
            } catch {
                throw APIError.decodingError()
            }
        }.mapError { failure in
            APIError.mapError(failure.localizedDescription)
        }
        
        return decodingPublisher
    }
    
    func mockAPIRequestWaiter() -> AnyPublisher<Int, Never> {
        return Just(123)
            .delay(for: 2, scheduler: DispatchQueue.global())
            .eraseToAnyPublisher()
    }
    
    
    
}

//do {
//    let decodeData = try JSONDecoder().decode(T.self, from: data)
//    return decodeData
//} catch {
//    throw APIError.decodingError()
//}
