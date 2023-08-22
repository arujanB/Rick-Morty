//
//  CharacterViewController.swift
//  Rick and Morty
//
//  Created by Aruzhan Boranbay on 21.08.2023.
//

//token
//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

import UIKit
import SnapKit
import Kingfisher

class CharacterViewController: UIViewController {
    
    let apiCaller = APICaller()
    
    var charactersData: CharacterModel?
//    let outDetail: ((Int) -> Void)?

    private lazy var titleName: UILabel = {
        let title = UILabel()
        title.text = "Charater"
        title.textColor = .white
        title.font = UIFont.boldSystemFont(ofSize: 30)
        return title
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: CharactersCollectionViewCell.IDENTIFIER)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(red: 4/255, green: 12/255, blue: 30/255, alpha: 1)
        
        setUpViews()
        setUpConstraints()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        apiCaller.fetchRequestCharacters(completion: { values in
            DispatchQueue.main.async {
                self.charactersData = values
                print("LIVE\(self.charactersData)")
                self.collectionView.reloadData()
            }
        })
        
    }

}

//MARK: - collectionViewDataSource
extension CharacterViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let countOfCards = charactersData?.results.count {
            return countOfCards
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionViewCell.IDENTIFIER, for: indexPath) as! CharactersCollectionViewCell
        cell.layer.cornerRadius = 10
        cell.setInfo(img: (charactersData?.results[indexPath.row].image)!, title: (charactersData?.results[indexPath.row].name)!)
//        cell.outputDetail = {
//            self.outDetail(indexPath.row)
//        }
        return cell
    }
    
}


//MARK: - CollectionView Delegate CellLayoutSize
extension CharacterViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: /*collectionView.frame.size.width - 10*/150, height: 200)
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = charactersData?.results[indexPath.row]
//        let vc = DetailViewController()
//        vc.itemData = cell
//        print(vc)
//        navigationController?.pushViewController(vc, animated: true)
//    }
}

//MARK: - setUpVies and setUpConstraints
extension CharacterViewController {
    func setUpViews(){
        view.addSubview(titleName)
        view.addSubview(collectionView)
    }
    
    func setUpConstraints(){
        titleName.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(20)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleName.snp.bottom).offset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
}
