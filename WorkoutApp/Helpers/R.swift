//
//  Resources.swift
//  WorkoutApp
//
//  Created by Dmitrii Tikhomirov on 4/23/23.
//

import UIKit

enum R {
  enum Colors {
    static let active = UIColor(hexString: "#437BFE")
    static let inactive = UIColor(hexString: "#929DA5")
    static let separator = UIColor(hexString: "#E8ECEF")
    static let titleGray = UIColor(hexString: "#545C77")
    static let background = UIColor(hexString: "#F8F9F9")
    static let secondary = UIColor(hexString: "#F0F3FF")
  }

  enum Strings {
    enum TabBar {
      static let overview = "Overview"
      static let session = "Session"
      static let progress = "Progress"
      static let settings = "Settings"
    }

    enum NavBar {
      static let overview = "Today"
      static let session = "High Intensity Cardio"
      static let progress = "Workout Progress"
      static let settings = "Settings"
    }

    enum Overview {
      static let allWorkoutsButton = "All Workouts"
    }

    enum Session {
      static let navBarStart = "Start"
      static let navBarPaused = "Pause"
      static let navBarFinish = "Finish"

      static let elapsedTime = "Elapsed Time"
      static let remainingTime = "RemainingTime"
    }

    enum Progress {
      static let navBarLeft = "Export"
      static let navBarRight = "Details"
    }
  }

  enum Images {
    enum TabBar {
      static let overview = UIImage(named: "House Icon")
      static let session = UIImage(named: "Clock Icon")
      static let progress = UIImage(named: "Analytics Bars")
      static let settings = UIImage(named: "Gear Icon")
    }

    enum Common {
      static let downArrow = UIImage(named: "Down Arrow")
      static let addButton = UIImage(named: "Add")
    }
  }

  enum Fonts {
    static func helveticaRegular(with size: CGFloat) -> UIFont {
      UIFont(name: "Helvetica", size: size) ?? UIFont()
    }
  }
}
