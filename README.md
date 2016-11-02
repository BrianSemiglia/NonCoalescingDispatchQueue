# NonCoalescingDispatchQueue

[![CI Status](http://img.shields.io/travis/Brian Semiglia/NonCoalescingDispatchQueue.svg?style=flat)](https://travis-ci.org/Brian Semiglia/NonCoalescingDispatchQueue)
[![Version](https://img.shields.io/cocoapods/v/NonCoalescingDispatchQueue.svg?style=flat)](http://cocoapods.org/pods/NonCoalescingDispatchQueue)
[![License](https://img.shields.io/cocoapods/l/NonCoalescingDispatchQueue.svg?style=flat)](http://cocoapods.org/pods/NonCoalescingDispatchQueue)
[![Platform](https://img.shields.io/cocoapods/p/NonCoalescingDispatchQueue.svg?style=flat)](http://cocoapods.org/pods/NonCoalescingDispatchQueue)

GCD likes to coalesce calls to -dispatchAfter. NonCoalescingDispatchQueue avoids that coalescence with the use of a CADisplayLink giving you timing accuracy to the 60th of a second.

## Example

```
NonCoalescingDispatchQueue(
  events: @[
    NonCoalescingDispatchQueue.Event(
      delay: 1,
      action: { 
        print("hi") 
      }
    ),
    NonCoalescingDispatchQueue.Event(
      delay: 1.002,
      action: { 
        print("hola")
      }
    ),
    NonCoalescingDispatchQueue.Event(
      delay: 1.004,
      action: { 
        print("hola")
      }
    )
  ],
  completion: {
    print("bye")
  }
)
```

## Requirements

## Installation

NonCoalescingDispatchQueue is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "NonCoalescingDispatchQueue"
```

## Author

Brian Semiglia, brian.semiglia@gmail.com

## License

NonCoalescingDispatchQueue is available under the MIT license. See the LICENSE file for more info.
