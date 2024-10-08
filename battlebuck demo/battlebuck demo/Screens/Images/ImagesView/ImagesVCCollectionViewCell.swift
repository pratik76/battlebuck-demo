//
//  ImagesVCCollectionViewCell.swift
//  battlebuck demo
//
//  Created by Pratik Choudhary on 27/09/24.
//

import UIKit

class ImagesVCCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var Images : UIImageView!
    @IBOutlet weak var nameLbl : UILabel!
   
    
    var imagesData : ImagesModel? {
        didSet {
            imagesConfig()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func imagesConfig () {
        guard let imagesData else {return}
        nameLbl.text = imagesData.title

        if let url = URL(string: imagesData.url ?? "") {
            Images.loadImage(from: url, placeholder: UIImage(named: "placeholder"))
        }
    }
}
