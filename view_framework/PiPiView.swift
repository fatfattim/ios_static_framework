//
//  PiPiView.swift
//  view_framework
//
//  Created by Tim Chen on 2018/4/16.
//  Copyright © 2018 PiPi. All rights reserved.
//

import UIKit

open class PiPiView: UIView {
    lazy private var gradientLayer: CAGradientLayer = self.initGradientLayer()
    
    /// An array of CGColorRef objects defining the color of each gradient stop
    var gradientColors: [CGColor] = [UIColor(red: (49/255), green: (57 / 255), blue: (70 / 255), alpha: 0.00).cgColor, UIColor( red: (49/255), green: (57 / 255), blue: (70 / 255), alpha: 0.85).cgColor] {
        didSet {
            gradientLayer.colors = gradientColors
        }
    }
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        gradientLayer.colors = gradientColors
        layer.addSublayer(gradientLayer)
    }
    
    private func initGradientLayer() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientLayerFrame()
        gradientLayer.anchorPoint = .zero
        gradientLayer.position = .zero
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.masksToBounds = true
        return gradientLayer
    }
    
    private func gradientLayerFrame() -> CGRect {
        return CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
    }
}
