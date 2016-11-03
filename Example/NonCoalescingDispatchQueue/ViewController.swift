//
//  ViewController.swift
//  NonCoalescingDispatchQueue
//
//  Created by Brian Semiglia on 11/01/2016.
//  Copyright (c) 2016 Brian Semiglia. All rights reserved.
//

import UIKit
import NonCoalescingDispatchQueue

class ViewController: UIViewController {
  
  var queue: NonCoalescingDispatchQueue?
  
  override func viewDidLoad() {
    super.viewDidLoad()

    queue = NonCoalescingDispatchQueue(
      events: [
        NonCoalescingDispatchQueue.Event(
          delay: 1.00,
          action: {
            print("hi")
          }
        ),
        NonCoalescingDispatchQueue.Event(
          delay: 1.03,
          action: {
            print("hola")
          }
        ),
        NonCoalescingDispatchQueue.Event(
          delay: 1.05,
          action: {
            print("salut")
          }
        )
      ],
      completion: {
        print("bye")
      }
    )
  }
  
}

