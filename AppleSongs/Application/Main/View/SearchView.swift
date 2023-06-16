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
        
        // MARK: UI
        
        private lazy var tableView: UITableView = {
            let res = UITableView(frame: .zero, style: .grouped)
            res.delegate = self
            res.dataSource = self
            res.backgroundColor = .clear
            res.showsVerticalScrollIndicator = false
            res.separatorStyle = .none
            res.register(TableViewCell.SearchViewCell.self)
            res.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
            res.contentInsetAdjustmentBehavior = .never
            res.rowHeight = 160
            res.translatesAutoresizingMaskIntoConstraints = false
            return res
        }()
        
        // MARK: - Properties
        
        private var viewModel = SearchViewModel()
        private var subscribers = Set<AnyCancellable>()
        private var searchItems: [Model.SearchModel] = []
        private var resultCount: Int = 20
        
        deinit {
            debugPrint(#function, String(describing: Self.self))
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            
            setupBindings()
            fetchSearch()
            setupViews()
        }
        
        private func setupViews() {
            view.backgroundColor = .systemBackground
            
            view.addSubview(tableView)
            
            
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
                tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
                tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
            ])
            
        }
        
        private func setupBindings() {
            viewModel.searchCompletion
                .receive(on: RunLoop.main)
                .sink(receiveValue: { [weak self] response in
                    guard let self = self else { return }
                    
                    if let items = response.results {
                        self.searchItems = items
                    }
                    
                    if let count = response.resultCount {
                        self.resultCount = count
                    }
                    self.loadTableView()
                })
                .store(in: &subscribers)

        }
        
        private func fetchSearch() {
            viewModel.fetchSearch(term: "Justin", limit: resultCount)
        }
        
        private func loadTableView() {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewController.Search: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell.SearchViewCell = tableView.dequeueCell(for: indexPath)
        let item = searchItems[indexPath.row]
        cell.fill(item)
        if indexPath.row == searchItems.count - 1 {
            self.resultCount += 20
            self.fetchSearch()
        }
        return cell
    }
}
