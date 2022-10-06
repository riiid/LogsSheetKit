//
//  LogsSheet.swift
//
//  Created by Jiyeon Song on 2022/06/17.
//  Copyright © 2022 Riiid Inc. All rights reserved.
//

import SPIndicator
import SwiftUI

public struct LogsSheet: View {
  @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
  private let logsManager: LogsSheetManager = LogsSheetManager.shared

  @State private var isAscending: Bool = false
  @State private var showCopiedIndicator: Bool = false
  @State private var searchText: String = ""

  private var filteredLogs: [ActionLog] {
    let sortedLogs: [ActionLog] = logsManager.getLogs()
      .sorted(by: {
        isAscending
        ? $0.timeStamp < $1.timeStamp
        : $0.timeStamp > $1.timeStamp
      })
    return searchText.isEmpty
    ? sortedLogs
    : sortedLogs.filter { $0.message.localizedCaseInsensitiveContains(searchText) }
  }

  public var body: some View {
    NavigationView {
      List {
        ForEach(filteredLogs) { log in
          Section(header: Text(log.timeStamp, formatter: dateFormatter)) {
            ScrollView(.horizontal, showsIndicators: false) {
              Button(
                action: {
                  UIPasteboard.general.string = dateFormatter.string(from: log.timeStamp) + "\n" + log.message
                  showCopiedIndicator = true
                },
                label: {
                  Text(log.message)
                    .font(Font.system(size: 12, design: .monospaced))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .padding()
                }
              )
            }
            .listRowInsets(.init())
          }
        }
      }
      .SPIndicator(
        isPresent: $showCopiedIndicator,
        title: "Copied to clipboard",
        duration: 3.0
      )
      .listStyle(.grouped)
      .navigationBarTitle("Logs for Debug")
      .modified {
        if #available(iOS 15.0, *) {
          $0.searchable(text: $searchText)
        } else {
          $0
        }
      }
      .toolbar {
        ToolbarItemGroup(placement: .bottomBar) {
          Button(
            action: {
              UIPasteboard.general.string = logsManager.getLogs()
                .map { dateFormatter.string(from: $0.timeStamp) + "\n" + $0.message }
                .joined(separator: "\n")
              showCopiedIndicator = true
            },
            label: {
              Text("Copy All")
            }
          )
          Spacer()
          Button(
            action: {
              logsManager.clearLogs()
            } ,
            label: {
              Text("Clear")
            }
          )
        }
        ToolbarItem(placement: .automatic) {
          Button(
            action: { isAscending.toggle() },
            label: {
              Image(systemName: isAscending ? "arrow.up.arrow.down.circle.fill" : "arrow.up.arrow.down.circle")
                .renderingMode(.template)
                .foregroundColor(.secondary)
            }
          )
        }
        ToolbarItem(placement: .destructiveAction) {
          Button(
            action: { presentationMode.wrappedValue.dismiss() },
            label: {
              Image(systemName: "xmark.circle.fill")
                .renderingMode(.template)
                .foregroundColor(.secondary)
            }
          )
        }
      }
    }
  }
}

private let dateFormatter: ISO8601DateFormatter = {
  let formatter: ISO8601DateFormatter = .init()
  formatter.timeZone = TimeZone.autoupdatingCurrent
  return formatter
}()

// MARK: Previewer

#warning("Add stubs")
struct LogsSheet_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LogsSheet()
        .previewDisplayName("LogsSheet | empty")

      LogsSheet()
        .previewDisplayName("LogsSheet | non empty")
    }
  }
}
