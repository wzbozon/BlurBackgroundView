//
//  BlurBackgroundView.swift
//
//  Created by Denis Kutlubaev on 01.02.2020.
//

import UIKit

public class BlurBackgroundView: UIView {
    public var isBlurred: Bool = true {
        didSet {
            blurAnimator?.fractionComplete = isBlurred ? Constants.defaultBlur : Constants.noBlur
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        layer.cornerRadius = 8
        layer.masksToBounds = true
        layer.backgroundColor = UIColor(white: 0.0, alpha: 0.01).cgColor

        blurView.backgroundColor = .clear
        blurView.frame = self.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        self.insertSubview(blurView, at: 0)

        blurAnimator = UIViewPropertyAnimator(duration: 1, curve: .linear) { [blurView] in
            blurView.effect = UIBlurEffect(style: .light)
        }

        blurAnimator?.fractionComplete = Constants.defaultBlur
    }

    deinit {
        blurAnimator?.stopAnimation(true)
        blurAnimator?.finishAnimation(at: .current)
    }

    private var blurAnimator: UIViewPropertyAnimator?

    private let blurView = UIVisualEffectView()

    private enum Constants {
        static let defaultBlur: CGFloat = 0.1
        static let noBlur: CGFloat = 0.0
    }
}
