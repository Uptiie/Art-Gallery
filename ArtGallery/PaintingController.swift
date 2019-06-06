//
//  PaintingController.swift
//  ArtGallery
//
//  Created by Uptiie on 6/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class PaintingController {
    
    var paintings: [Painting] = []
    
    init() {
        self.loadPaintingsFromAssets()
    }

    func loadPaintingsFromAssets() {
        for number in 1...12 {
            let stringForImage = "Image\(number)"
            guard let image = UIImage(named: stringForImage) else { continue }
            
            let painting = Painting(image: image)
            
            self.paintings.append(painting)
        }
    }
    
    func toggleIsLiked(for painting: Painting) {
        painting.isLiked = !painting.isLiked
    }
}
