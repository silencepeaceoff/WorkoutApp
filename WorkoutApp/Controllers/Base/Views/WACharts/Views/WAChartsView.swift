//
//  WAChartsView.swift
//  WorkoutApp
//
//  Created by Dmitrii Tikhomirov on 5/5/23.
//

import UIKit

extension WAChartsView {
  struct Data {
    let title: String
    let value: Int
  }
}

final class WAChartsView: WABaseView {

  private let yAxisView = YAxisView()
  private let xAxisView = XAxisView()

  private let chartView = ChartView()

  func configure(with data: [WAChartsView.Data], topChartOffset: Int) {
    yAxisView.configure(with: data)
    xAxisView.configure(with: data)
    chartView.configure(with: data, topChartOffset: topChartOffset)
  }

}

extension WAChartsView {
  override func setupViews() {
    super.setupViews()

    setupView(yAxisView)
    setupView(xAxisView)
    setupView(chartView)
  }

  override func constraintViews() {
    super.constraintViews()

    NSLayoutConstraint.activate([
      yAxisView.topAnchor.constraint(equalTo: topAnchor),
      yAxisView.leadingAnchor.constraint(equalTo: leadingAnchor),
      yAxisView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -12),

      xAxisView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 8),
      xAxisView.bottomAnchor.constraint(equalTo: bottomAnchor),
      xAxisView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 4),

      chartView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
      chartView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -16),
      chartView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
      chartView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 16)
    ])
  }

  override func configureAppearance() {
    super.configureAppearance()
    
    backgroundColor = .clear
  }
}
