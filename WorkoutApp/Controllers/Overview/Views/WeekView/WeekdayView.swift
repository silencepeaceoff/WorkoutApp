//
//  WeekdayView.swift
//  WorkoutApp
//
//  Created by Dmitrii Tikhomirov on 4/24/23.
//

import UIKit

extension WeekView {
  final class WeekdayView: WABaseView {
    
    private let nameLabel: UILabel = {
      let label = UILabel()
      label.font = R.Fonts.helveticaRegular(with: 9)
      label.textAlignment = .center
      return label
    }()
    
    private let dateLabel: UILabel = {
      let label = UILabel()
      label.font = R.Fonts.helveticaRegular(with: 15)
      label.textAlignment = .center
      return label
    }()
    
    private let stackView: UIStackView = {
      let view = UIStackView()
      view.spacing = 3
      view.axis = .vertical
      return view
    }()
    
    func configure(with index: Int, and name: String) {
      let startOfWeek = Date().startOfWeek
      let currentDay = startOfWeek.goForward(to: index)
      let day = Date.calendar.component(.day, from: currentDay)
      let isToday = currentDay.stripTime() == Date().stripTime()
      
      backgroundColor = isToday ? R.Colors.active : R.Colors.background
      
      nameLabel.text = name.uppercased()
      nameLabel.textColor = isToday ? .white : R.Colors.inactive
      
      dateLabel.text = "\(day)"
      dateLabel.textColor = isToday ? .white : R.Colors.inactive
    }
  }
}

extension WeekView.WeekdayView {
  override func setupViews() {
    super.setupViews()
    
    setupView(stackView)
    stackView.addArrangedSubview(nameLabel)
    stackView.addArrangedSubview(dateLabel)
  }
  
  override func constraintViews() {
    super.constraintViews()
    
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
  
  override func configureAppearance() {
    super.configureAppearance()
    
    layer.cornerRadius = 5
    layer.masksToBounds = true
  }
}
