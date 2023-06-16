//
//  Repository.swift
//  AppleSongs
//
//  Created by Mohammad on 6/13/23.
//

import Foundation
import Combine


// MARK: - Search Controller
protocol SearchServiceProtocol: ServiceProtocol {
    func search(term: String, limit: Int) -> AnyPublisher<Model.BaseModel<Model.SearchModel>, Error>
}

final class SearchService: SearchServiceProtocol {
    let networkController: NetworkControllerProtocol

    init(networkController: NetworkControllerProtocol) {
        self.networkController = networkController
    }
    
    func search(term: String, limit: Int) -> AnyPublisher<Model.BaseModel<Model.SearchModel>, Error> {
        let api = API.Search.search(term: term, limit: limit)

        return networkController.get(type: Model.BaseModel<Model.SearchModel>.self,
                                     url: api.endPoint.url, headers: [:])
    }
}
