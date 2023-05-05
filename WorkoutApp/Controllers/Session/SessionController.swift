//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Dmitrii Tikhomirov on 4/23/23.
//

import UIKit

class SessionController: BaseController {

  private let timerView = TimerView()
  private let timerDuration = 15.0

  private let statsView = StatsView(with: R.Strings.Session.workoutStats)
  private let stepsView = StepsView(with: R.Strings.Session.stepsCounter)


  override func navBarLeftButtonHandler() {
    if timerView.state == .isStopped {
      timerView.startTimer { progress in
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
          self.navBarRightButtonHandler()
          print(progress)
        }
      }
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
    view.setupView(statsView)
    view.setupView(stepsView)
  }

  override func constraintViews() {
    super.constraintViews()
    
    NSLayoutConstraint.activate([
      timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
      timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
      timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),

      statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
      statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 10),
      statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -7.5),

      stepsView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 7.5),
      stepsView.topAnchor.constraint(equalTo: statsView.topAnchor),
      stepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
      stepsView.heightAnchor.constraint(equalTo: statsView.heightAnchor)
    ])
  }

  override func configureAppearance() {
    super.configureAppearance()

    title = R.Strings.NavBar.session
    navigationController?.tabBarItem.title = R.Strings.TabBar.session

    addNavBarButton(at: .left, with: R.Strings.Session.navBarStart)
    addNavBarButton(at: .right, with: R.Strings.Session.navBarFinish)

    timerView.configure(with: timerDuration, progress: 0)

    statsView.configure(with: [.hearthRate(value: "155"),
                               .averagePace(value: "9'20''"),
                               .totalDistance(value: "8.25"),
                               .totalSteps(value: "7,682")
    ])
    stepsView.configure(with: [
      .init(value: "8k", heightMultiplier: 1, title: "2/13"),
      .init(value: "7k", heightMultiplier: 0.8, title: "2/14"),
      .init(value: "5k", heightMultiplier: 0.5, title: "2/15"),
      .init(value: "6k", heightMultiplier: 0.6, title: "2/16"),
    ])
  }
}
