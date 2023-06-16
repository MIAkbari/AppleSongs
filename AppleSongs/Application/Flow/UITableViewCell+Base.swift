//
//  UITableViewCell+Base.swift
//  AppleSongs
//
//  Created by Mohammad on 6/16/23.
//

import UIKit

extension TableViewCell {
    class Base: UITableViewCell {
        
        // MARK: PROPERTIS

        
        // MARK: INIT
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            clipsToBounds = true
            initialize()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func initialize() {
            setupViews()
            setupLayouts()
        }
        
        // MARK: FUNC
        
        public func setupViews() {
            selectionStyle = .none
        }
        
        public func setupLayouts() {
            
        }
    }
}
