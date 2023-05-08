//
//  SectionHeader.swift
//  WorkoutApp
//
//  Created by Dmitrii Tikhomirov on 5/6/23.
//

import UIKit

final class SectionHeaderView: UICollectionReusableView {
  static let id = "SectionHeaderView"
  
  private let title: UILabel = {
    let label = UILabel()
    label.font = R.Fonts.helveticaRegular(with: 13)
    label.textColor = R.Colors.inactive
    label.textAlignment = .center
    return label
  }()
  
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
  
  func configure(with date: Date) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE, MMMM dd"
    
    self.title.text = dateFormatter.string(from: date).uppercased()
  }
}

extension SectionHeaderView {
  
  func setupViews() {
    setupView(title)
  }
  
  func constraintViews() {
    NSLayoutConstraint.activate([
      title.centerYAnchor.constraint(equalTo: centerYAnchor),
      title.centerXAnchor.constraint(equalTo: centerXAnchor)
    ])
  }
  
  func configureAppearance() {
    
  }
}
