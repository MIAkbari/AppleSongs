//
//  ViewController.swift
//  AppleSongs
//
//  Created by Mohammad on 6/13/23.
//

import UIKit
import Combine

extension ViewController {
    
    class Search: UIViewController {
        
        // MARK: - Properties
        private var viewModel = SearchViewModel()
        private var subscribers = Set<AnyCancellable>()
        
        deinit {
            debugPrint("The \(self)", #function)
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            
            setupBindings()
            fetchSearch()
            setupViews()
        }
        
        private func setupViews() {
            view.backgroundColor = .yellow
        }
        
        private func setupBindings() {
            viewModel.searchCompletion
                .receive(on: RunLoop.main)
                .sink(receiveValue: { [weak self] response in
                    guard let self = self else { return }
                    
 
                })
                .store(in: &subscribers)

        }
        
        private func fetchSearch() {
            viewModel.fetchSearch(term: "Justin", limit: 25)
        }
    }
}

