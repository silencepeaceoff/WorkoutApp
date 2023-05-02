//
//  TimerView.swift
//  WorkoutApp
//
//  Created by Dmitrii Tikhomirov on 4/27/23.
//

import UIKit

enum TimerState {
  case isRunning
  case isPaused
  case isStopped
}

final class TimerView: WABaseInfoView {

  private let elapsedTimeLabel: UILabel = {
    let label = UILabel()
    label.text = R.Strings.Session.elapsedTime
    label.font = R.Fonts.helveticaRegular(with: 14)
    label.textColor = R.Colors.inactive
    label.textAlignment = .center
    return label
  }()

  private let elapsedTimeValueLabel: UILabel = {
    let label = UILabel()
    label.text = "02:15"
    label.font = R.Fonts.helveticaRegular(with: 46)
    label.textColor = R.Colors.titleGray
    label.textAlignment = .center
    return label
  }()

  private let remainingTimeLabel: UILabel = {
    let label = UILabel()
    label.text = R.Strings.Session.remainingTime
    label.font = R.Fonts.helveticaRegular(with: 13)
    label.textColor = R.Colors.inactive
    label.textAlignment = .center
    return label
  }()

  private let remainingTimeValueLabel: UILabel = {
    let label = UILabel()
    label.text = "12:45"
    label.font = R.Fonts.helveticaRegular(with: 13)
    label.textColor = R.Colors.titleGray
    label.textAlignment = .center
    return label
  }()

  private let timeStackView: UIStackView = {
    let view = UIStackView()
    view.axis = .vertical
    view.distribution = .fillProportionally
    view.spacing = 10
    return view
  }()

  private let progressView = ProgressView()
  private var timer = Timer()
  private var timerProgress: CGFloat = 0
  private var timerDuration = 0.0

  public var state: TimerState = .isStopped

  func configure(with duration: Double, progress: Double) {
    timerDuration = duration

    let tempCurrentValue = progress > duration ? duration : progress
    let goalValueDevider = duration == 0 ? 1 : duration
    let percent = tempCurrentValue / goalValueDevider

    progressView.drawProgress(with: CGFloat(percent))
  }

  func startTimer() {
    timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
      guard let self = self else { return }
      self.timerProgress += 0.01

      if self.timerProgress > self.timerDuration {
        self.timerProgress = self.timerDuration
        timer.invalidate()
      }

      self.configure(with: self.timerDuration, progress: self.timerProgress)
    })
  }

  func pauseTimer() {
    timer.invalidate()
  }

  func stopTimer() {
    guard self.timerProgress > 0 else { return }
    timer.invalidate()

    timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                 repeats: true,
                                 block: { [weak self] timer in
      guard let self = self else { return }
      self.timerProgress -= 0.1

      if self.timerProgress <= 0 {
        self.timerProgress = 0
        timer.invalidate()
      }

      self.configure(with: self.timerDuration, progress: self.timerProgress)
    })
  }
}

extension TimerView {

  override func setupViews() {
    super.setupViews()

    setupView(progressView)
    setupView(timeStackView)

    [
      elapsedTimeLabel,
      elapsedTimeValueLabel,
      remainingTimeLabel,
      remainingTimeValueLabel
    ].forEach {
      timeStackView.addArrangedSubview($0)
    }
  }

  override func constraintViews() {
    super.constraintViews()

    NSLayoutConstraint.activate([
      progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
      progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
      progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
      progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
      progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),

      timeStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
      timeStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor)
    ])
  }

  override func configureAppearance() {
    super.configureAppearance()


  }

}
