//
//  Network.swift
//  AppleSongs
//
//  Created by Mohammad on 6/13/23.
//

import Combine
import Foundation

// MARK: - Network Controller
protocol NetworkControllerProtocol: AnyObject {
    typealias Headers = [String: Any]

    func get<T>(type: T.Type,
                url: URL,
                headers: Headers) -> AnyPublisher<T, Error> where T: Decodable

}

final class NetworkController: NetworkControllerProtocol {

    private var subscription = Set<AnyCancellable>()

    // MARK: Get generic API
    func get<T: Decodable>(type: T.Type,
                           url: URL,
                           headers: Headers) -> AnyPublisher<T, Error> {
        var urlRequest = URLRequest(url: url)

        headers.forEach { key, value in
            if let value = value as? String {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }

        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .map { data in
                debugPrint("### URL: ", url.absoluteURL)
                debugPrint("### headers: ", headers.debugDescription)
                debugPrint("### response: ", data.prettyPrintedJSONString as Any)
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

}

// MARK: - HTTP Method

enum HttpMethod: String {
    case get
}
