//
//  LogsSheetManager.swift
//  
//
//  Created by Yessen Yermukhanbet on 2022/10/06.
//

import Foundation
import Combine

final public class LogsSheetManager: ObservableObject {
  public static var shared: LogsSheetManager = LogsSheetManager()

  @Published var logs: [ActionLog] = []

  public func log(message: String) {
    let log: ActionLog = ActionLog(message: message)
    LogsSheetManager.shared.logs.append(log)
  }
}
