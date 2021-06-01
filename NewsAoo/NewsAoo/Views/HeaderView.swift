//
//  HeaderView.swift
//  NewsAoo
//
//  Created by Tushar Vijayvargiya on 27/05/21.
//

import UIKit
final class HeaderView: UIView
{
    private var fontsize: CGFloat
    
    private lazy var headinglabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "News"
        v.font = UIFont.boldSystemFont(ofSize: fontsize)
        return v
    }()
    private lazy var headerCircleImage: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        let config = UIImage.SymbolConfiguration(pointSize: fontsize, weight: .bold)
        v.image = UIImage(systemName: "largecircle.fill.circle", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        return v
    }()
    private lazy var plusImage: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        let config = UIImage.SymbolConfiguration(pointSize: fontsize, weight: .bold)
        v.image = UIImage(systemName: "lplus", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        return v
    }()
    private lazy var subheadLineLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = v.font.withSize(fontsize)
        v.text = "Top Headines"
        v.textColor = .gray
        return v
    }()
    private lazy var headerstackView: UIStackView = {
        let v = UIStackView(arrangedSubviews: [headerCircleImage,headinglabel,plusImage])
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .horizontal
        return v
    }()
    
    init(fontsize: CGFloat)
    {
        self.fontsize = fontsize
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView() {
        addSubview(headerstackView)
        addSubview(subheadLineLabel)
        setupConstraints()
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([headerstackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     headerstackView.topAnchor.constraint(equalTo: topAnchor)
                                    ])
        NSLayoutConstraint.activate([subheadLineLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     subheadLineLabel.topAnchor.constraint(equalTo: headerstackView.bottomAnchor,constant: 8),
                                     subheadLineLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        ])
        
        
    }
    
}
