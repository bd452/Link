//
//  String.swift
//  Link
//
//  Created by BRYCE P DOUGHERTY on 10/16/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import Foundation

public extension String {
    func split(separatedBy: String) -> (String, String) {
        let parts = self.components(separatedBy: separatedBy)
        return (parts[0], parts[1])
    }
}
