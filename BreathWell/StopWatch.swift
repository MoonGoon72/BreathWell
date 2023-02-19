//
//  StopWatch.swift
//  BreathWell
//
//  Created by cnu on 2023/02/19.
//

import Foundation
class StopWatch {
    private var startTime: Date?
    func start() -> Void {
        self.startTime = Date()
    }
    func stop() -> Void {
        self.startTime = nil
    }
    func elapsedTime() -> TimeInterval {
        return -(self.startTime?.timeIntervalSinceNow ?? 0)
    }
    
}
