//
//  NonCoalescingDispatchQueue.swift
//  NonCoalescingDispatchQueue
//
//  Created by Brian Semiglia on 9/18/16.
//

final class NonCoalescingDispatchQueue {
    
    struct Event {
        let delay: TimeInterval
        let action: () -> Void
    }
    
    var timer: CADisplayLink?
    let start = Date()
    var events = [Event]()
    let completion: (() -> Void)?
    
    init(events: [Event], completion: (() -> Void)?) {
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
