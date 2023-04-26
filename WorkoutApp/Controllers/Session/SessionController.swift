//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Dmitrii Tikhomirov on 4/23/23.
//

import UIKit

class SessionController: BaseController {
    
    private let timerView: WABaseInfoView = {
        let view = WABaseInfoView(with: "Test", buttonTitle: "TestButton".uppercased())
        
        return view
    }()
}

extension SessionController {
    override func setupViews() {
        super.setupViews()
        view.setupView(timerView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        title = R.Strings.NavBar.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.session
        
        addNavBarButton(at: .left, with: R.Strings.Session.navBarLeft)
        addNavBarButton(at: .right, with: R.Strings.Session.navBarRight)
    }
}
