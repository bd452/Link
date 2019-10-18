//
//  Timer.swift
//  Link
//
//  Created by BRYCE P DOUGHERTY on 10/15/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import Foundation

public extension Timer {
    
    convenience init(timeInterval: TimeInterval, action: @autoclosure @escaping ()->Void, userInfo: Any?, repeats: Bool) {
        self.init(timeInterval: timeInterval, action: action, userInfo: userInfo, repeats: repeats)
    }
    convenience init(timeInterval: TimeInterval, action: @escaping () -> Void, userInfo: Any?, repeats: Bool) {
        let sel = AutoSelector(action)
        self.init(timeInterval: timeInterval, target: sel, selector: sel.do, userInfo: userInfo, repeats: repeats)
    }
}
