//
//  PaintingTableViewCell.swift
//  ArtGallery
//
//  Created by Uptiie on 6/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol PaintingTableViewCellDelegate: class {
    func likedButtonWasTapped(on cell: PaintingTableViewCell)
}

class PaintingTableViewCell: UITableViewCell {

    // Mark: - Outlets and Properties
    
    
    @IBOutlet weak var PaintingImageView: UIImageView!
    @IBOutlet weak var isLikedButton: UIButton!
    
    weak var delegate: PaintingTableViewCellDelegate?
    
    var painting: Painting? {
        didSet {
            self.updateViews()
        }
    }
    
    // Mark: IBActions and Methods

    @IBAction func isLikedButtonTapped(_ sender: Any) {
        self.delegate?.likedButtonWasTapped(on: self)
        
    }
    
    func updateViews() {
        guard let painting = self.painting else { return }
        self.PaintingImageView.image = painting.image
        
        let isLikedString = painting.isLiked ? "Unlike" : "Like"
        self.isLikedButton.setTitle(isLikedString, for: .normal)
    }
    
    
    
    
    
    
}
