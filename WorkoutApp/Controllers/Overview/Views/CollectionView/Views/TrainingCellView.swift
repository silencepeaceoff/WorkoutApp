//
//  CellView.swift
//  WorkoutApp
//
//  Created by Dmitrii Tikhomirov on 5/6/23.
//

import UIKit

enum CellRondedType {
  case top, bottom, all, notRounded
}

final class TrainingCellView: UICollectionViewCell {

  static let id = "TrainingCellView"

  private let checkmarkView = UIImageView(image: R.Images.Overview.unchecked)

  private let stackView: UIStackView = {
    let view = UIStackView()
    view.axis = .vertical
    view.spacing = 3
    return view
  }()

  private let title: UILabel = {
    let label = UILabel()
    label.font = R.Fonts.helveticaRegular(with: 17)
    label.textColor = R.Colors.titleGray
    return label
  }()

  private let subtitle: UILabel = {
    let label = UILabel()
    label.font = R.Fonts.helveticaRegular(with: 13)
    label.textColor = R.Colors.inactive
    return label
  }()

  private let rightArrow = UIImageView(image: R.Images.Overview.rightArrow)

  override init(frame: CGRect) {
    super .init(frame: frame)

    setupViews()
    constraintViews()
    configureAppearance()
  }

  required init?(coder: NSCoder) {
    super .init(frame: .zero)

    setupViews()
    constraintViews()
    configureAppearance()
  }

  func configure(with title: String, subtitle: String, isDone: Bool, roundedType: CellRondedType) {
    self.title.text = title
    self.subtitle.text = subtitle

    checkmarkView.image = isDone ? R.Images.Overview.checked : R.Images.Overview.unchecked

    switch roundedType {
    case .all: self.roundCorners([.allCorners], radius: 15)
    case .top: self.roundCorners([.topLeft, .topRight], radius: 15)
    case .bottom: self.roundCorners([.bottomLeft, .bottomRight], radius: 15)
    case .notRounded: self.roundCorners([.allCorners], radius: 0)
    }
    
  }
}

extension TrainingCellView {

  func setupViews() {
    setupView(checkmarkView)
    setupView(stackView)
    stackView.addArrangedSubview(title)
    stackView.addArrangedSubview(subtitle)
    setupView(rightArrow)
  }

  func constraintViews() {
    NSLayoutConstraint.activate([
      checkmarkView.centerYAnchor.constraint(equalTo: centerYAnchor),
      checkmarkView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      checkmarkView.heightAnchor.constraint(equalToConstant: 28),
      checkmarkView.widthAnchor.constraint(equalTo: checkmarkView.heightAnchor),

      stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
      stackView.leadingAnchor.constraint(equalTo: checkmarkView.trailingAnchor, constant: 15),
      stackView.trailingAnchor.constraint(equalTo: rightArrow.leadingAnchor, constant: -15),

      rightArrow.centerYAnchor.constraint(equalTo: centerYAnchor),
      rightArrow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
      rightArrow.heightAnchor.constraint(equalToConstant: 12),
      rightArrow.widthAnchor.constraint(equalToConstant: 7)
    ])
  }

  func configureAppearance() {
    backgroundColor = .white
//    layer.borderWidth = 1
//    layer.borderColor = R.Colors.separator.cgColor
  }
}
