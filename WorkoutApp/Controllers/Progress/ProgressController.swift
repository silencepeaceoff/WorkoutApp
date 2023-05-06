//
//  ProgressController.swift
//  WorkoutApp
//
//  Created by Dmitrii Tikhomirov on 4/23/23.
//

import UIKit

class ProgressController: BaseController {

  private let dailyPerformanceView = DailyPerformanceView(with: R.Strings.Progress.dailyPerformance,
                                                          buttonTitle: R.Strings.Progress.last7Days)
  private let monthlyPerformanceView = MonthlyPerformanceView(with: R.Strings.Progress.monthlyPerformance,
                                                          buttonTitle: R.Strings.Progress.last10Moths)

  override func viewDidLoad() {
    super.viewDidLoad()

  }
}

extension ProgressController {

  override func setupViews() {
    super.setupViews()

    view.setupView(dailyPerformanceView)
    view.setupView(monthlyPerformanceView)
  }

  override func constraintViews() {
    super.constraintViews()

    NSLayoutConstraint.activate([
      dailyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
      dailyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
      dailyPerformanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
      dailyPerformanceView.heightAnchor.constraint(equalTo: dailyPerformanceView.widthAnchor, multiplier: 0.68),

      monthlyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
      monthlyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
      monthlyPerformanceView.topAnchor.constraint(equalTo: dailyPerformanceView.bottomAnchor, constant: 15),
      monthlyPerformanceView.heightAnchor.constraint(equalTo: monthlyPerformanceView.widthAnchor, multiplier: 1.06)
    ])
  }

  override func configureAppearance() {
    super.configureAppearance()

    title = R.Strings.NavBar.progress
    navigationController?.tabBarItem.title = R.Strings.TabBar.progress

    addNavBarButton(at: .left, with: R.Strings.Progress.navBarLeft)
    addNavBarButton(at: .right, with: R.Strings.Progress.navBarRight)

    dailyPerformanceView.configure(with: [
      .init(value: "1", heightMultiplier: 0.2, title: "mon"),
      .init(value: "2", heightMultiplier: 0.4, title: "tue"),
      .init(value: "3", heightMultiplier: 0.6, title: "wen"),
      .init(value: "4", heightMultiplier: 0.8, title: "thu"),
      .init(value: "5", heightMultiplier: 1, title: "fri"),
      .init(value: "3", heightMultiplier: 0.6, title: "sat"),
      .init(value: "2", heightMultiplier: 0.4, title: "sun")
    ])

    monthlyPerformanceView.configure(with: [.init(title: "mar", value: 45),
                                            .init(title: "apr", value: 55),
                                            .init(title: "may", value: 60),
                                            .init(title: "jun", value: 65),
                                            .init(title: "jul", value: 70),
                                            .init(title: "aug", value: 80),
                                            .init(title: "sep", value: 65),
                                            .init(title: "okt", value: 45),
                                            .init(title: "nov", value: 30),
                                            .init(title: "dec", value: 15)
                                           ],
    topChartOffset: 10)
  }
}
