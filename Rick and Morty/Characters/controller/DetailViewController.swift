//
//  DetailViewController.swift
//  Rick and Morty
//
//  Created by Aruzhan Boranbay on 22.08.2023.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    let resultData: Result
    
    init(resultData: Result) {
        self.resultData = resultData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var img: UIImageView = {
        let img = UIImageView(image: UIImage(named: ""))
        return img
    }()
    
    private lazy var titleName: UILabel = {
        let title = UILabel()
        title.text = "Aruzhan Boranbay"
        title.textAlignment = .center
        title.textColor = .white
        title.font = UIFont.boldSystemFont(ofSize: 20)
        return title
    }()
    
    private lazy var live: UILabel = {
        let live = UILabel()
        live.textColor = .green
        live.textAlignment = .center
        return live
    }()
    
    private lazy var stackViewHeader: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [img, titleName, live])
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .init(red: 4/255, green: 12/255, blue: 30/255, alpha: 1)
        
        setUpViews()
        setUpConstraints()
    }
    
    
    
}

//MARK: - setUpVies and setUpConstraints
extension DetailViewController {
    func setUpViews(){
        view.addSubview(titleName)
    }
    
    func setUpConstraints(){
        titleName.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

