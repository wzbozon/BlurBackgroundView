//
//  ViewController.swift
//  BlurBackgroundView
//
//  Created by Denis Kutlubaev on 09.07.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let childViewController = ChildViewController(nibName: "ChildViewController", bundle: nil)
        guard let childView = childViewController.view else { return }
        childView.frame = view.bounds
        view.addSubview(childView)
        addChild(childViewController)
        childViewController.didMove(toParent: self)
    }

}

