//
//  Endpoint.swift
//  AppleSongs
//
//  Created by Mohammad on 6/13/23.
//

import Foundation

let configuration = UrlConfiguration()

class UrlConfiguration {
    var scheme: String
    var host: String

    init() {
        if let dictionary = Bundle.main.infoDictionary,
           let configuration = dictionary["Configuration"] as? String {
            let path = Bundle.main.path(forResource: "Configuration", ofType: "plist")
            let config = NSDictionary(contentsOfFile: path!)
            for (key, value) in config! {
                if let key = key as? String,
                   let value = value as? [String: Any] {
                    if key == configuration {
                        scheme = value["scheme"] as? String ?? ""
                        host = value["host"]  as? String ?? ""
                        return
                    }
                }
            }
        }
        fatalError("Error: Configuration file doesn't exist in project directory")
    }
}

enum ConfigureAddress {

    // MARK: - URL addresses

    static let scheme = configuration.scheme
    static let host = configuration.host

    private static let imageURL = "\(scheme)://\(host)"

    // MARK: - URL helper methods

    static func getImageUrl(url: String) -> String {
        if url.hasPrefix("http") {
            return url
        } else {
            var cleanUrl = url
            if url.hasPrefix("/") {
                cleanUrl = String(url.dropFirst())
            }
            return ConfigureAddress.imageURL + cleanUrl
        }
    }
    
}

func generateBoundary() -> String {
    "Boundary-\(NSUUID().uuidString)"
}


struct EndPoint {
    var path: String
    var queryItems: [String: Any] = [:]
}

extension EndPoint {

    static let boundary: String = generateBoundary()

    var url: URL {
        var components = URLComponents()
        components.scheme = ConfigureAddress.scheme
        components.host = ConfigureAddress.host
        components.path = path
        
        var queryParameterItems: [URLQueryItem] = []

        queryItems.forEach { (item: (key: AnyHashable, value: Any)) in
            if let items = item.value as? [UInt64] {
                items.forEach({ int in
                    queryParameterItems.append(URLQueryItem(name: "\(item.key)" + "[]", value: "\(int)"))
                })
            } else {
                queryParameterItems.append(URLQueryItem(name: "\(item.key)", value: "\(item.value)"))
            }
        }

        components.queryItems?.forEach({ item in
            queryParameterItems.append(item)
        })

        if queryParameterItems != [] {
            components.queryItems = queryParameterItems
        }

        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }

        return url
    }
}
