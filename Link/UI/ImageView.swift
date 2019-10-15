//
//  UIImage+Construction.swift
//  Link
//
//  Created by Bryce Dougherty on 10/8/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import Foundation

public typealias ImageView = UIImageView

//open class ImageView: UIImageView {
//    public func image(_ image: UIImage) -> ImageView {
//        self.image = image
//        return self
//    }
//}

public extension ImageView {
    func image(_ image: UIImage) -> Self {
        self.image = image
        return self
        
    }
    func withImage(_ image: (UIImage?) -> Void) -> Self {
        image(self.image)
        return self
    }
}
