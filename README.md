# Lucas Coin API

[![CI Status](https://img.shields.io/travis/lucaswkuipers/LucasCoinAPI.svg?style=flat)](https://travis-ci.org/lucaswkuipers/LucasCoinAPI)
[![Version](https://img.shields.io/cocoapods/v/LucasCoinAPI.svg?style=flat)](https://cocoapods.org/pods/LucasCoinAPI)
[![License](https://img.shields.io/cocoapods/l/LucasCoinAPI.svg?style=flat)](https://cocoapods.org/pods/LucasCoinAPI)
[![Platform](https://img.shields.io/cocoapods/p/LucasCoinAPI.svg?style=flat)](https://cocoapods.org/pods/LucasCoinAPI)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

API is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LucasCoinAPI'
```

## Usage (example)
```swift
import LucasCoinAPI

let coins = [Coin]

override viewDidLoad() {
...

coins = API.requestCoinList(on: self)

}
```

## Author

Lucas Werner Kuipers, lucaswkuipers@gmail.com

## License

API is available under the MIT license. See the LICENSE file for more info.
