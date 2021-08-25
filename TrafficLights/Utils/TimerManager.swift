//
//  TimerManager.swift
//  TrafficLights
//
//  Created by Taha  YILMAZ on 25.08.2021.
//

import Foundation

enum TimeLineDirection {
    case up, down
}


final class TimerManager {
    private let deadline: Int
    var direction: TimeLineDirection = .down
    
    init(deadline: Int) {
        self.deadline = deadline
    }
    
    func startTimer(_ completion: @escaping (_: TimeLineDirection)->Void) {
        var deadline = self.deadline
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {[weak self] timer in
            guard let self = self else {return}
            if deadline == 0 {
                timer.invalidate()
                completion(self.direction)
            }else {
                deadline -= 1
            }
        }
    }
    
}
