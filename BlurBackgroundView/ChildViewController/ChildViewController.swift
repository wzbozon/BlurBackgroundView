//
//  ChildViewController.swift
//  BlurBackgroundView
//
//  Created by Denis Kutlubaev on 09.07.2022.
//

import UIKit

class ChildViewController: UIViewController {

    @IBOutlet var blurSwitch: UISwitch!
    @IBOutlet var blurBackgroundView: BlurBackgroundView!

    override func viewDidLoad() {
        super.viewDidLoad()

        blurSwitch.isOn = true
    }

    @IBAction func blurSwitchValueChanged(_ sender: UISwitch) {
        blurBackgroundView.isBlurred = blurSwitch.isOn
    }

}
