import XCTest
@testable import LogsSheetKit

final class LogsSheetKitTests: XCTestCase {
  func testLogsSheetManagerLogsNotEmptyAfterLoggin() {
    LogsSheetManager.shared.log(message: "this is my log")

    XCTAssertTrue(LogsSheetManager.shared.logs.isEmpty == false)
  }
}
