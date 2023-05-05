//
//  WABarView.swift
//  WorkoutApp
//
//  Created by Dmitrii Tikhomirov on 5/4/23.
//

import UIKit

final class WABarsView: WABaseView {

  private let stackView: UIStackView = {
    let view = UIStackView()
    view.distribution = .fillEqually
    return view
  }()

  func configure(with data: [WABarView.Data]) {
    data.forEach {
      let barView = WABarView(data: $0)
      stackView.addArrangedSubview(barView)
    }
  }
}

extension WABarsView {
  override func setupViews() {
    super.setupViews()

    setupView(stackView)
  }

  override func constraintViews() {
    super.constraintViews()

    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }

  override func configureAppearance() {
    super.configureAppearance()
    backgroundColor = .clear
  }
}
