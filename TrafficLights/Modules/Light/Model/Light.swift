//
//  Light.swift
//  TrafficLights
//
//  Created by Taha  YILMAZ on 25.08.2021.
//

import UIKit

struct Light {
    let color: UIColor
    var isOn: Bool = false
    let timerManager: TimerManager
    
    mutating func on() {
        self.isOn = true
    }
    
    mutating func off() {
        self.isOn = false
    }
}
