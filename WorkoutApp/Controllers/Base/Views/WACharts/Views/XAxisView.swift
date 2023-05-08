//
//  XAxisView.swift
//  WorkoutApp
//
//  Created by Dmitrii Tikhomirov on 5/5/23.
//

import UIKit

final class XAxisView: WABaseView {
  
  private let stackView: UIStackView = {
    let view = UIStackView()
    view.axis = .horizontal
    view.distribution = .equalSpacing
    return view
  }()
  
  func configure(with data: [WAChartsView.Data]) {
    stackView.arrangedSubviews.forEach {
      $0.removeFromSuperview()
    }
    data.forEach {
      let label = UILabel()
      label.font = R.Fonts.helveticaRegular(with: 9)
      label.textColor = R.Colors.inactive
      label.text = $0.title.uppercased()
      stackView.addArrangedSubview(label)
    }
  }
}

extension XAxisView {
  override func setupViews() {
    super.setupViews()
    
    setupView(stackView)
  }
  
  override func constraintViews() {
    super.constraintViews()
    
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
  }
  
  override func configureAppearance() {
    super.configureAppearance()
    backgroundColor = .clear
  }
}
