# LogsSheetKit

## Table of contents

1. [Introduction](#introduction)
2. [Usage](#usage)
3. [Installation](#installation)
4. [Contribution](#contribution)
5. [Maintainers](#maintainers)

## Introduction

Lightweight customizable logger for iOS using Swift 5.7, with minimum iOS 14 version.

## Usage

Usage of LogsSheetKit is pretty stright-forward, since LogsSheetKit handles most of the work by itself.

In order to log any message, just call LogsSheetManager.shared.log(message: "your message to be logged")

``` swift
        LogsSheetManager.shared.log(message: "Riiid!")
```

In order to open LogsSheetView, just present LogsSheet(), and that's it!
 
 
## Installation

Riiid's LogsSheetKit can be installed through Swift Package Manager easily and with comfort.

```swift
let package = Package(
  name: "MyPackage",
  dependencies: [
    .package(url: "https://github.com/riiid/LogsSheetKit.git", .upToNextMajor(from: "1.0.0"))
  ],
  targets: [
    .target(name: "MyTarget", dependencies: ["LogsSheetKit"])
  ]
)
```


## Contribution

Any discussion and or pull requests are welcome!

In order to contribute, please subbranch from main, and after finishing the work open PR to main branch. Please note that PR should be reviewed by 2 people from code owners!

Please provide as much information about your proposed changes as possible.

## Maintainers

- [tisohjung](https://github.com/tisohjung)
- [korJAEYOUNGYUN](https://github.com/korJAEYOUNGYUN)
- [SongJiyeon](https://github.com/SongJiyeon) 
- [yermukhanbet](https://github.com/yermukhanbet)

## License

LogsSheetKit is under MIT license. See the [LICENSE](https://github.com/riiid/LogsSheetKit/blob/main/LICENSE.md) for more info.
