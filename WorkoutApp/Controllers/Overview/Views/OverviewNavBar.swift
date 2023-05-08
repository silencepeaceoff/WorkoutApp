//
//  OverviewNavBar.swift
//  WorkoutApp
//
//  Created by Dmitrii Tikhomirov on 4/23/23.
//

import UIKit

final class OverviewNavBar: WABaseView {
  
  private let allWorkoutsButton: WAButton = {
    let button = WAButton(wth: .secondary)
    button.setTitle(R.Strings.Overview.allWorkoutsButton)
    return button
  }()
  
  private let addButton: UIButton = {
    let button = UIButton()
    button.setImage(R.Images.Common.addButton, for: .normal)
    return button
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = R.Strings.NavBar.overview
    label.textColor = R.Colors.titleGray
    label.font = R.Fonts.helveticaRegular(with: 22)
    return label
  }()
  
  private let weekView = WeekView()
  
  override func layoutSubviews() {
    addBottomBorder(with: R.Colors.separator, width: 1)
  }
  
  func addAllWorkoutsAction(_ action: Selector, with target: Any?) {
    allWorkoutsButton.addTarget(target, action: action, for: .touchUpInside)
  }
  
  func addAdditingAction(_ action: Selector, with target: Any?) {
    addButton.addTarget(target, action: action, for: .touchUpInside)
  }
}

extension OverviewNavBar  {
  override func setupViews() {
    super.setupViews()
    setupView(addButton)
    setupView(titleLabel)
    setupView(allWorkoutsButton)
    setupView(weekView)
  }
  
  override func constraintViews() {
    super.constraintViews()
    NSLayoutConstraint.activate([
      addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
      addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
      addButton.heightAnchor.constraint(equalToConstant: 28),
      addButton.widthAnchor.constraint(equalToConstant: 28),
      
      allWorkoutsButton.topAnchor.constraint(equalTo: addButton.topAnchor),
      allWorkoutsButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
      allWorkoutsButton.heightAnchor.constraint(equalToConstant: 28),
      
      titleLabel.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      
      weekView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
      weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
      weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
      weekView.heightAnchor.constraint(equalToConstant: 47)
    ])
  }
  
  override func configureAppearance() {
    super.configureAppearance()
    backgroundColor = .white
  }
}
