//
//  Background_Timer.swift
//  macos-temperature-monitor
//
//  Created by Robert Grizzard on 2/22/20.
//  Copyright © 2020 Robert Grizzard. All rights reserved.
//
//  With thanks to Daniel Galasko
//  https://gist.github.com/danielgalasko
//

import Foundation

class Background_Timer: ObservableObject {
    
    @Published var counter = 0
    
    let myRT: RepeatingTimer
    
    init() {
        
        myRT = RepeatingTimer(timeInterval: 10)
        myRT.eventHandler = {
            print("Timer Fired")
            self.incrementCounter()
            print("Counter value: \(self.counter)")
        }
        myRT.resume()
    }
    
    func incrementCounter() {
        DispatchQueue.main.async {
            self.counter += 1
        }
    }
    
}

class RepeatingTimer {

    let timeInterval: TimeInterval
    
    init(timeInterval: TimeInterval) {
        self.timeInterval = timeInterval
    }
    
    private lazy var timer: DispatchSourceTimer = {
        let t = DispatchSource.makeTimerSource()
        t.schedule(deadline: .now() + self.timeInterval, repeating: self.timeInterval)
        t.setEventHandler(handler: { [weak self] in
            self?.eventHandler?()
        })
        return t
    }()

    var eventHandler: (() -> Void)?

    private enum State {
        case suspended
        case resumed
    }

    private var state: State = .suspended

    deinit {
        timer.setEventHandler {}
        timer.cancel()
        /*
         If the timer is suspended, calling cancel without resuming
         triggers a crash. This is documented here https://forums.developer.apple.com/thread/15902
         */
        resume()
        eventHandler = nil
    }

    func resume() {
        if state == .resumed {
            return
        }
        state = .resumed
        timer.resume()
    }

    func suspend() {
        if state == .suspended {
            return
        }
        state = .suspended
        timer.suspend()
    }
}

