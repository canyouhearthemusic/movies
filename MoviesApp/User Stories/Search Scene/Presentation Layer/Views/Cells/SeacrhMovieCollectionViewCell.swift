//
//  SeacrhMovieCollectionViewCell.swift
//  MoviesApp
//
//  Created by Alibek on 16.04.2024.
//

import UIKit

class SeacrhMovieCollectionViewCell: UICollectionViewCell {
    private let posterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    func configure(movie: MoviePosterModel) {
        guard let url = URL(string: Constants.imageHost + movie.posterPath) else { return }
        posterImage.kf.setImage(with: url)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {
        contentView.addSubview(posterImage)
        contentView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            posterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            posterImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
