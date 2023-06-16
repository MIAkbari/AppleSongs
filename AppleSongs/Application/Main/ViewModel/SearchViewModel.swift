//
//  SearchViewModel.swift
//  AppleSongs
//
//  Created by Mohammad on 6/16/23.
//

import Foundation
import Combine

final class SearchViewModel {
    let searchCompletion = PassthroughSubject<Model.BaseModel<Model.SearchModel>, Never>()

    var searchService: SearchServiceProtocol
    private var subscribers = Set<AnyCancellable>()

    init() {
        let network = NetworkController()
        searchService = SearchService(networkController: network)
    }

    func fetchSearch(term: String, limit: Int) {
        searchService.search(term: term, limit: limit)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    print("Finished Search")
                }
            } receiveValue: { [weak self] response in
                guard let self = self else { return }

                
                self.searchCompletion.send(response)
            }
            .store(in: &subscribers)
    }
}
