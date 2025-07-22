# RSSwiftUtils

RSSwiftUtils is a Swift Package Manager (SPM) library providing a collection of utility functions and extensions to simplify and accelerate iOS/macOS development. It includes helpers for working with strings, attributed strings, dates, and asynchronous operations, making your codebase cleaner and more efficient.

## Features
- String pattern matching and formatting
- Attributed string styling utilities
- Date utilities for formatting and calculations
- Async helpers for modern Swift concurrency
- Easily extensible and lightweight

## Installation

### Swift Package Manager
Add RSSwiftUtils to your project using Xcode:
1. Go to **File > Add Packages...**
2. Enter the repository URL:
   ```
   https://github.com/yourusername/RSSwiftUtils.git
   ```
3. Select the version and add the package to your target.

Or add it directly to your `Package.swift`:
```swift
.package(url: "https://github.com/yourusername/RSSwiftUtils.git", from: "1.0.0")
```

## Usage

Import the library in your Swift file:
```swift
import RSSwiftUtils
```

### Example: Attributed String Pattern Styling
```swift
let input = AttributedString("Hello **World**!")
let styled = input.updateTextStyleByPattern(prefix: "**", suffix: "**", font: .bold(.body), color: .red)
```

### Example: Remove Accents from String
```swift
let clean = "Café".removingAccents // "Cafe"
```

## Contributing
Contributions are welcome! Please open issues or submit pull requests for new features, bug fixes, or improvements.

## License
This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

## Version
- Current version: 1.0.21 