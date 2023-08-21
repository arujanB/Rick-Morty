//
//  CharactersCollectionViewCell.swift
//  Rick and Morty
//
//  Created by Aruzhan Boranbay on 21.08.2023.
//

import UIKit
import SnapKit

class CharactersCollectionViewCell: UICollectionViewCell {
    static let IDENTIFIER = "CharactersCollectionViewCell"
    
    private lazy var img: UIImageView = {
        let img = UIImageView(image: UIImage(named: ""))
        img.backgroundColor = .red
        img.layer.cornerRadius = 10
        return img
    }()
    
    private lazy var textTitle: UILabel = {
        let text = UILabel()
        text.text = "Text"
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(img)
        stackView.addArrangedSubview(textTitle)
        stackView.distribution = .equalSpacing
        stackView.spacing = 7
        stackView.axis = .vertical
        stackView.layer.cornerRadius = 10
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - setUpVies and setUpConstraints
extension CharactersCollectionViewCell {
    func setUpViews(){
        addSubview(stackView)
    }
    
    func setUpConstraints(){
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        img.snp.makeConstraints { make in
            make.width.height.equalTo(140)
        }
        
//        textTitle.snp.makeConstraints { make in
//            make.bottom.equalToSuperview().inset(10)
//        }
    }
}
