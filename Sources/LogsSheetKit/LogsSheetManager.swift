//
//  LogsSheetManager.swift
//  
//
//  Created by Yessen Yermukhanbet on 2022/10/06.
//

import Foundation

public struct LogsSheetManager {
  public static var shared: LogsSheetManager = LogsSheetManager()

  private var logs: [ActionLog] = []

  public func log(message: String) {
    let log: ActionLog = ActionLog(message: message)
    LogsSheetManager.shared.logs.append(log)
  }

  public func getLogs() -> [ActionLog] {
    LogsSheetManager.shared.logs
  }

  public func clearLogs() {
    LogsSheetManager.shared.logs.removeAll()
  }
}
