//
//  NonCoalescingDispatchQueue.swift
//  NonCoalescingDispatchQueue
//
//  Created by Brian Semiglia on 9/18/16.
//

final public class NonCoalescingDispatchQueue {
  
  public struct Event {
    public let delay: TimeInterval
    public let action: () -> Void
    public init(delay: TimeInterval, action: @escaping () -> Void) {
      self.delay = delay
      self.action = action
    }
  }
  
  var timer: CADisplayLink?
  let start = Date()
  var events = [Event]()
  let completion: (() -> Void)?
  
  public init(events: [Event], completion: (() -> Void)?) {
    self.events = events
    self.completion = completion
    timer = CADisplayLink(
      target: self,
      selector: #selector(didFire(_:))
    )
    timer?.add(
      to: .main,
      forMode: .defaultRunLoopMode
    )
  }
  
  @objc func didFire(_ input: CADisplayLink) {
    let since = Date().timeIntervalSince(start)
    events
      .filter{ since >= $0.delay }
      .forEach {
        $0.action()
    }
    events = events.filter { since < $0.delay }
    if events.count == 0 {
      timer?.invalidate()
      completion?()
    }
  }
  
}
