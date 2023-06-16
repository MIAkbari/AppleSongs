//
//  UITableViewCell+Extetnions.swift
//  AppleSongs
//
//  Created by Mohammad on 6/16/23.
//

import UIKit

extension UITableViewCell {
    
    static var identifier: String {
        return NSStringFromClass(self)
    }
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
}

extension UITableView {
    
    func register<T: UITableViewCell>(_ cell: T.Type) {
        self.register(cell.self, forCellReuseIdentifier: cell.identifier)
    }
    
    func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath) -> T  {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("failed to dequeue \(T.self)")
        }
        return cell
    }
}
