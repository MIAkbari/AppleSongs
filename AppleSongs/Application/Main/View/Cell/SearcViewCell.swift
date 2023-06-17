//
//  SearcViewCell.swift
//  AppleSongs
//
//  Created by Mohammad on 6/16/23.
//

import UIKit


extension TableViewCell {
    class SearchViewCell: Base {
        
        // MARK: UI
        
        private lazy var artWorkImageView: UIImageView = {
            let res = UIImageView()
            res.backgroundColor = .red
            res.layer.cornerRadius = 8
            res.translatesAutoresizingMaskIntoConstraints = false
            res.clipsToBounds = true
            res.contentMode = .scaleToFill
            return res
        }()
        
        private lazy var trackNameLabel: UILabel = {
            let res = UILabel()
            res.font = .systemFont(ofSize: 20)
            res.textColor = .label
            res.translatesAutoresizingMaskIntoConstraints = false
            return res
        }()
        
        private lazy var artistNameLabel: UILabel = {
            let res = UILabel()
            res.font = .systemFont(ofSize: 17)
            res.textColor = .label
            res.translatesAutoresizingMaskIntoConstraints = false
            return res
        }()
        
        private lazy var relaseDateLabel: UILabel = {
            let res = UILabel()
            res.font = .systemFont(ofSize: 12)
            res.textColor = .label
            res.translatesAutoresizingMaskIntoConstraints = false
            return res
        }()
        
        private lazy var descriptionLabel: UILabel = {
            let res = UILabel()
            res.font = .systemFont(ofSize: 10)
            res.textColor = .label
            res.numberOfLines = 3
            res.translatesAutoresizingMaskIntoConstraints = false
            return res
        }()
        
        // MARK: PROPERTIS
        
        override func initialize() {
            super.initialize()
            
            
            // read func from base...
        }
        
        // DI - Func get from model
        public func fill(_ model: Model.SearchModel) {
            
            artWorkImageView.loadImageUsingCacheWithURLString(model.artworkUrl100 ?? "", placeHolder: nil)
            trackNameLabel.text = model.trackName
            artistNameLabel.text = model.artistName
            relaseDateLabel.text = model.releaseDate?.convertToDate()
            descriptionLabel.text = model.longDescription?.maxLength(length: 150)
        }
        
        
        override func setupViews() {
        
            selectionStyle = .none
            
        }
        
        override func setupLayouts() {
            
            // addsubView
            addSubview(artWorkImageView)
            addSubview(trackNameLabel)
            addSubview(artistNameLabel)
            addSubview(relaseDateLabel)
            addSubview(descriptionLabel)
            
            // active
            NSLayoutConstraint.activate([
                // artwork image
                artWorkImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),
                artWorkImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                artWorkImageView.heightAnchor.constraint(equalToConstant: 150),
                artWorkImageView.widthAnchor.constraint(equalToConstant: 100),

                // track name
                trackNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                trackNameLabel.leadingAnchor.constraint(equalTo: artWorkImageView.trailingAnchor, constant: 5),
                trackNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
                
                // artist name
                artistNameLabel.topAnchor.constraint(equalTo: trackNameLabel.bottomAnchor, constant: 10),
                artistNameLabel.leadingAnchor.constraint(equalTo: artWorkImageView.trailingAnchor, constant: 5),
                artistNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
                
                // relaseDateLabel
                relaseDateLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: 10),
                relaseDateLabel.leadingAnchor.constraint(equalTo: artWorkImageView.trailingAnchor, constant: 5),
                relaseDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
                
                // descriptionLabel
                descriptionLabel.topAnchor.constraint(equalTo: relaseDateLabel.bottomAnchor, constant: 10),
                descriptionLabel.leadingAnchor.constraint(equalTo: artWorkImageView.trailingAnchor, constant: 5),
                descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)

            ])
        }
    }
}
