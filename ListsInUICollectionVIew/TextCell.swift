//
//  TextCell.swift
//  ListsInUICollectionVIew
//
//  Created by cmStudent on 2021/09/19.
//

import UIKit

class TextCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setUpaccountCell(name: String,number: String) {
        self.name.text = name
        self.number.text = number
        
    }
}
