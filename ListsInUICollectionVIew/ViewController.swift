//
//  ViewController.swift
//  ListsInUICollectionVIew
//
//  Created by cmStudent on 2021/09/19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let likelistList = ["いいねしたチャット", "いいねした質問"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView(collectionView)
        setUpNavigatinonBar()
        
        let config = UICollectionLayoutListConfiguration(appearance:.insetGrouped)
        collectionView.collectionViewLayout =
            UICollectionViewCompositionalLayout.list(using: config)
        
    }
    
    private func setUpNavigatinonBar() {
        // 色
        navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 248/255, blue: 250/255, alpha: 1)
        // ボーダーを消す
        navigationController?.navigationBar.shadowImage = UIImage()
        //largeTitle表示
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        //laegeTitle(大)時の文字
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font : UIFont.italicSystemFont(ofSize: 40.0)
        ]
    }
    
    private func setupCollectionView(_ collectionView: UICollectionView) {
        
        collectionView.dataSource = self
        collectionView.delegate   = self
        
        collectionView.register(UINib(nibName: TextCell.reuseIdentifier, bundle: nil),
                                forCellWithReuseIdentifier: TextCell.reuseIdentifier)
        collectionView.register(UINib(nibName: LikeCell.reuseIdentifier, bundle: nil),
                                forCellWithReuseIdentifier: LikeCell.reuseIdentifier)
        
        collectionView.collectionViewLayout = createListViewLayout()
        collectionView.backgroundColor = .clear
        
    }
    
    
    
}
extension ViewController {
    private enum kind: CaseIterable {
        case account
        case list
        case logout
    }
    private func createListViewLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let sectionLayoutKind = kind.allCases[sectionIndex]
            
            switch sectionLayoutKind {
            
            case .account:
                return self.acountLayout()
                
            case .list:
                return self.acountLayout()
                
            case .logout:
                return self.acountLayout()
            }
            
        }
        
        return layout
        
    }
    private func acountLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(1 / 7))
        
        // countを2にすることで1行に2つカラムを表示
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        // 個々のカラムのスペース
        let spacing = CGFloat(20)
        
        group.interItemSpacing = .fixed(spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.interGroupSpacing = spacing
        
        // 画面の両端スペース
        section.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 30, bottom: 30, trailing: 30)
        
        return section
        
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource{
    // sectionの数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return kind.allCases.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionLayoutKind = kind.allCases[section]
        
        switch sectionLayoutKind {
        
        case .account:
            return 1
        case .list:
            return likelistList.count
        case .logout:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionLayoutKind = kind.allCases[indexPath.section]
        
        switch sectionLayoutKind {
        
        case .account:
            let textCell = collectionView.dequeueReusableCell(withReuseIdentifier: TextCell.reuseIdentifier, for: indexPath) as! TextCell
            textCell.setUpaccountCell(name: "電子 太郎", number: "10cm0000@jec.ac.jp")
            return textCell
            
        case .list:
            let likeCell = collectionView.dequeueReusableCell(withReuseIdentifier: LikeCell.reuseIdentifier, for: indexPath) as! LikeCell
            likeCell.setUpSubjectCell(title: likelistList[indexPath.row])
            return likeCell
        case .logout:
            let likeCell = collectionView.dequeueReusableCell(withReuseIdentifier: LikeCell.reuseIdentifier, for: indexPath) as! LikeCell
            likeCell.setUpSubjectCell(title: "ログアウト")
            return likeCell
        }
    }
}
