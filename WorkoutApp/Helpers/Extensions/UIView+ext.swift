//
//  UIView+ext.swift
//  WorkoutApp
//
//  Created by Dmitrii Tikhomirov on 4/23/23.
//

import UIKit

extension UIView {
    func addBottomBorder(with color: UIColor, width: CGFloat) {
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        separator.frame = CGRect(x: 0,
                                 y: frame.height - width,
                                 width: frame.width,
                                 height: width)
        addSubview(separator)
    }
}
