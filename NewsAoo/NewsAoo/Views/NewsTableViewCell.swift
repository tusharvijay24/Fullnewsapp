//
//  NewsTableViewCell.swift
//  NewsAoo
//
//  Created by Tushar Vijayvargiya on 27/05/21.
//

import UIKit
final class NewsTableViewCell:UITableViewCell
{
    var newsVM: NewsViewModel?
    {
        didSet
        {
            if let newsVM = newsVM {
                titleLabel.text = newsVM.title
                NetworkManager.shared.getimage(urlstring: newsVM.urltoImage) { Data in
                    guard let data = Data else {return}
                    DispatchQueue.main.async {
                        self.newsImage.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    var newsImageData:Data?
    {
        didSet{
            if let data = newsImageData
            {
                
            }
        }
    }
    private lazy var newsImage: shadowImageView = {
        let v = shadowImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var titleLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.numberOfLines = 0
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView()
    {
        addSubview(titleLabel)
        addSubview(newsImage)
        setupConstraints()
    }
    func setupConstraints()
    {
        NSLayoutConstraint.activate([
            newsImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsImage.topAnchor.constraint(equalTo: topAnchor),
            newsImage.heightAnchor.constraint(equalToConstant: 200)
            ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
            ])
    }
}
