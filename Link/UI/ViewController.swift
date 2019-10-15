//
//  ViewController.swift
//  Link
//
//  Created by Bryce Dougherty on 10/8/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import UIKit

open class ViewController: UIViewController {

    var onDidLoad: ((View?) -> Void)?
    var onWillAppear: ((Bool) -> Void)?
    var onWillDisappear: ((Bool) -> Void)?
    var onDidAppear: ((Bool) -> Void)?
    var onDidDisappear: ((Bool) -> Void)?
    var onWillLayoutSubviews: (() -> Void)?
    var onDidLayoutSubviews: (() -> Void)?
    var onPrepareForSegue:((UIStoryboardSegue, Any) -> Void)?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        onDidLoad?(self.view)
        // Do any additional setup after loading the view.
    }
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        onWillAppear?(animated)
    }
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        onWillDisappear?(animated)
    }
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        onDidAppear?(animated)
    }
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        onDidDisappear?(animated)
    }
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        onWillLayoutSubviews?()
    }
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        onDidLayoutSubviews?()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
public extension ViewController {
    func didLoad(_ closure: @escaping (View?) -> Void) -> Self {
        self.onDidLoad = closure
        return self
    }
    func willAppear(_ closure: @escaping (Bool) -> Void) -> Self {
        self.onWillAppear = closure
        return self
    }
    func willDisappear(_ closure: @escaping (Bool) -> Void) -> Self {
        self.onWillDisappear = closure
        return self
    }
    func didAppear(_ closure: @escaping (Bool) -> Void) -> Self {
        self.onDidAppear = closure
        return self
    }
    func didDisappear(_ closure: @escaping (Bool) -> Void) -> Self {
        self.onDidDisappear = closure
        return self
    }
    func willLayoutSubviews(_ closure: @escaping () -> Void) -> Self {
        self.onWillLayoutSubviews = closure
        return self
    }
    func didLayoutSubviews(_ closure: @escaping () -> Void) -> Self {
        self.onDidLayoutSubviews = closure
        return self
    }
    func prepareforSegue(_ closure: @escaping ((_ segue: UIStoryboardSegue, _ sender: Any) -> Void)) -> Self {
        self.onPrepareForSegue = closure
        return self
    }
    func then(_ aa:((ViewController) -> Void)?) -> Self {
        aa?(self)
        return self
    }
    func withView(_ view: (View)->Void) -> Self {
        view(self.view)
        return self
    }
}
