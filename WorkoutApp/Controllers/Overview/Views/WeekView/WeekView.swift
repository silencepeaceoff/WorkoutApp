//
//  WeekView.swift
//  WorkoutApp
//
//  Created by Dmitrii Tikhomirov on 4/24/23.
//

import UIKit

final class WeekView: WABaseView {
  
  private let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.spacing = 7
    stackView.distribution = .fillEqually
    return stackView
  }()
}

extension WeekView {
  
  override func setupViews() {
    super.setupViews()
    
    setupView(stackView)
  }
  
  override func constraintViews() {
    super.constraintViews()
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  override func configureAppearance() {
    super.configureAppearance()
    
    var weekdays = Date.calendar.shortStandaloneWeekdaySymbols
    
    if Date.calendar.firstWeekday == 2 {
      let sun = weekdays.remove(at: 0)
      weekdays.append(sun)
    }
    
    
    weekdays.enumerated().forEach { index, name in
      let view = WeekdayView()
      view.configure(with: index, and: name)
      stackView.addArrangedSubview(view)
    }
  }
}
