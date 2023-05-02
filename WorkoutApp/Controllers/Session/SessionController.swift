//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Dmitrii Tikhomirov on 4/23/23.
//

import UIKit

class SessionController: BaseController {

  private let timerView = TimerView()
  private let timerDuration = 13.0

  override func navBarLeftButtonHandler() {
    if timerView.state == .isStopped {
      timerView.startTimer()
    } else {
      timerView.pauseTimer()
    }

    timerView.state = timerView.state == .isRunning ? .isStopped : .isRunning
    setTitleForNavBarButton(
      timerView.state == .isRunning ? R.Strings.Session.navBarPaused : R.Strings.Session.navBarStart,
      at: .left
    )
  }

  override func navBarRightButtonHandler() {
    timerView.stopTimer()
    timerView.state = .isStopped

    setTitleForNavBarButton(R.Strings.Session.navBarStart, at: .left)
  }
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
      timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15)
    ])
  }

  override func configureAppearance() {
    super.configureAppearance()

    title = R.Strings.NavBar.session
    navigationController?.tabBarItem.title = R.Strings.TabBar.session

    addNavBarButton(at: .left, with: R.Strings.Session.navBarStart)
    addNavBarButton(at: .right, with: R.Strings.Session.navBarFinish)

    timerView.configure(with: timerDuration, progress: 0)
  }
}
