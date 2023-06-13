//
//  Size.swift
//  AppleSongs
//
//  Created by Mohammad on 6/13/23.
//

import Foundation

extension Theme.Size {
    enum Margins {
        /// 4
        static let margin4: CGFloat = 4
        /// 8
        static let margin8: CGFloat = 8
        /// 12
        static let margin12: CGFloat = 12
        /// 16
        static let margin16: CGFloat = 16
        /// 20
        static let margin20: CGFloat = 20
        /// 24
        static let margin24: CGFloat = 24
        /// 32
        static let margin32: CGFloat = 32
        /// 40
        static let margin40: CGFloat = 40
        /// 48
        static let margin48: CGFloat = 48
    }
    
    enum Size {
        static let buttonsHeight: CGFloat = 48
        static let iconsHeight24: CGFloat = 24
        static let corner16: CGFloat = 16
        static let corner8: CGFloat = 8
    }
    
    enum Border {
        static let selectedBorder: CGFloat = 2.0
        static let notSelectedBorder: CGFloat = 1.0
    }
}
