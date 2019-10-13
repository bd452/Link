//
//  UIImage+Construction.swift
//  Propel
//
//  Created by Bryce Dougherty on 10/8/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import Foundation


public class ImageView: UIImageView {
    public func image(_ image: UIImage) -> ImageView {
        self.image = image
        return self
    }
}

public extension ImageView {
}
