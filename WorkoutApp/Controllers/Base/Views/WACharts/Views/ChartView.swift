//
//  ChartView.swift
//  WorkoutApp
//
//  Created by Dmitrii Tikhomirov on 5/5/23.
//

import UIKit

final class ChartView: WABaseView {

  private let yAxisSeperator: UIView = {
    let view = UIView()
    view.backgroundColor = R.Colors.separator
    return view
  }()

  private let xAxisSeperator: UIView = {
    let view = UIView()
    view.backgroundColor = R.Colors.separator
    return view
  }()

  func configure(with data: [WAChartsView.Data], topChartOffset: Int = 10) {
    layoutIfNeeded()
    drawDashLines()
    drawChart(with: data, topChartOffset: topChartOffset)
  }
}

extension ChartView {
  override func setupViews() {
    super.setupViews()

    setupView(yAxisSeperator)
    setupView(xAxisSeperator)
  }

  override func constraintViews() {
    super.constraintViews()

    NSLayoutConstraint.activate([
      yAxisSeperator.topAnchor.constraint(equalTo: topAnchor),
      yAxisSeperator.bottomAnchor.constraint(equalTo: bottomAnchor),
      yAxisSeperator.leadingAnchor.constraint(equalTo: leadingAnchor),
      yAxisSeperator.widthAnchor.constraint(equalToConstant: 1),

      xAxisSeperator.leadingAnchor.constraint(equalTo: leadingAnchor),
      xAxisSeperator.bottomAnchor.constraint(equalTo: bottomAnchor),
      xAxisSeperator.trailingAnchor.constraint(equalTo: trailingAnchor),
      xAxisSeperator.heightAnchor.constraint(equalToConstant: 1)
    ])
  }

  override func configureAppearance() {
    super.configureAppearance()

    backgroundColor = .clear
  }
}

private extension ChartView {

  func drawDashLines(with counts: Int = 9) {
    (0..<counts).map { CGFloat($0) }.forEach {
      drawDashLine(at: bounds.height / CGFloat(counts) * $0)
    }
  }

  func drawDashLine(at yPosition: CGFloat) {
    let startPoint = CGPoint(x: 0, y: yPosition)
    let endPoint = CGPoint(x: bounds.width, y: yPosition)

    let dashPath = CGMutablePath()
    dashPath.addLines(between: [startPoint, endPoint])

    let dashLayer = CAShapeLayer()
    dashLayer.strokeColor = R.Colors.separator.cgColor
    dashLayer.lineWidth = 1
    dashLayer.lineDashPattern = [6, 3]
    dashLayer.path = dashPath
    layer.addSublayer(dashLayer)
  }

  func drawChart(with data: [WAChartsView.Data], topChartOffset: Int) {
    guard let maxValue = data.sorted(by: { $0.value > $1.value }).first?.value else { return }
    let valuePoints = data.enumerated().map { CGPoint(x: CGFloat($0), y: CGFloat($1.value)) }
    let chartHeght = bounds.height / CGFloat(maxValue + topChartOffset)

    let points = valuePoints.map {
      let x = bounds.width / CGFloat(valuePoints.count - 1) * $0.x
      let y = bounds.height - $0.y * chartHeght
      return CGPoint(x: x, y: y)
    }

    let chartPath = UIBezierPath()
    chartPath.move(to: points[0])

    points.forEach {
      chartPath.addLine(to: $0)
      drawChartDot(at: $0)
    }

    let chartLayer = CAShapeLayer()
    chartLayer.path = chartPath.cgPath
    chartLayer.strokeColor = R.Colors.active.cgColor
    chartLayer.fillColor = UIColor.clear.cgColor
    chartLayer.lineWidth = 3
    chartLayer.strokeEnd = 1
    chartLayer.lineCap = .round
    chartLayer.lineJoin = .round

    layer.addSublayer(chartLayer)
  }

  func drawChartDot(at point: CGPoint) {
    let dotPath = UIBezierPath()
    dotPath.move(to: point)
    dotPath.addLine(to: point)

    let dotLayer = CAShapeLayer()
    dotLayer.path = dotPath.cgPath
    dotLayer.strokeColor = R.Colors.active.cgColor
    dotLayer.lineCap = .round
    dotLayer.lineWidth = 10

    layer.addSublayer(dotLayer)
  }
}
