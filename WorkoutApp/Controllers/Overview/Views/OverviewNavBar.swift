//
//  OverviewNavBar.swift
//  WorkoutApp
//
//  Created by Dmitrii Tikhomirov on 4/23/23.
//

import UIKit

final class OverviewNavBar: BaseView {
    
    private let allWorkoutsButton = SecondaryButton()
    private let addButton = UIButton()
    private let titleLabel = UILabel()
    
    private let weekView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue.withAlphaComponent(0.2)
        return view
    }()
    
    override func layoutSubviews() {
        addBottomBorder(with: Resources.Colors.separator, width: 1)
    }
    
    func addAllWorkoutsAction(_ action: Selector, with target: Any?) {
        allWorkoutsButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func addAdditingAction(_ action: Selector, with target: Any?) {
        addButton.addTarget(target, action: action, for: .touchUpInside)
    }
}

extension OverviewNavBar  {
    override func addViews() {
        super.addViews()
        addView(addButton)
        addView(titleLabel)
        addView(allWorkoutsButton)
        addView(weekView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),
            
            allWorkoutsButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWorkoutsButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: 28),
            allWorkoutsButton.widthAnchor.constraint(equalToConstant: 130),
            
            titleLabel.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            weekView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
            weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            weekView.heightAnchor.constraint(equalToConstant: 47)
        ])
    }
    
    override func configure() {
        super.configure()
        backgroundColor = .white

        titleLabel.text = Resources.Strings.NavBar.overview
        titleLabel.textColor = Resources.Colors.titleGray
        titleLabel.font = Resources.Fonts.helveticaRegular(with: 22)

        allWorkoutsButton.setTitle(Resources.Strings.Overview.allWorkoutsButton)

        addButton.setImage(Resources.Images.Common.addButton, for: .normal)
    }
}
