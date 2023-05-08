//
//  YAxisView.swift
//  WorkoutApp
//
//  Created by Dmitrii Tikhomirov on 5/5/23.
//

import UIKit

final class YAxisView: WABaseView {
  
  private let stackView: UIStackView = {
    let view = UIStackView()
    view.axis = .vertical
    view.distribution = .equalSpacing
    return view
  }()
  
  func configure(with data: [WAChartsView.Data]) {
    guard let maxValue = data.sorted(by: { $0.value > $1.value }).first?.value else { return }
    stackView.arrangedSubviews.forEach {
      $0.removeFromSuperview()
    }
    (0...9).reversed().forEach {
      let label = UILabel()
      label.font = R.Fonts.helveticaRegular(with: 9)
      label.textColor = R.Colors.inactive
      label.textAlignment = .right
      label.text = "\($0 * 10)" // TODO: - Remake to right interval
      stackView.addArrangedSubview(label)
    }
  }
}

extension YAxisView {
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

