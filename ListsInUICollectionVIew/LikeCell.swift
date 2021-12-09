//
//  LikeCell.swift
//  ListsInUICollectionVIew
//
//  Created by cmStudent on 2021/09/20.
//

import UIKit

class LikeCell: UICollectionViewCell {

    @IBOutlet weak var likeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setUpSubjectCell(title: String) {
        likeLabel.text = title
    }
}
