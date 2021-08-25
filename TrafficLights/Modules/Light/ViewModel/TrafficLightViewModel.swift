//
//  TrafficLightViewModel.swift
//  TrafficLights
//
//  Created by Taha  YILMAZ on 25.08.2021.
//

import Foundation


final class TrafficLightViewModel {
    enum Change {
        case lightChange(Light)
    }
    
    private enum Const {
        static let redTime: Int = 1
        static let yellowTime: Int = 1
        static let greenTime: Int = 1
    }
    
    private var redLight = Light(color: .red, timerManager: TimerManager(deadline: Const.redTime)) {
        didSet {
            guard let changeHandler = changeHandler else {return}
            changeHandler(.lightChange(redLight))
        }
    }
    
    private var yellowLight = Light(color: .yellow, timerManager: TimerManager(deadline: Const.yellowTime)){
        didSet {
            guard let changeHandler = changeHandler else {return}
            changeHandler(.lightChange(yellowLight))
        }
    }
    
    private var greenLight = Light(color: .green, timerManager: TimerManager(deadline: Const.greenTime)){
        didSet {
            guard let changeHandler = changeHandler else {return}
            changeHandler(.lightChange(greenLight))
        }
    }
    
    private var changeHandler: ((Change)->Void)?
    
    func bind(changeHandler: @escaping ((Change)->Void)) {
        self.changeHandler = changeHandler
    }
    
    func proceedToInfo() {
        AppRouter.shared.proceedToInfo()
    }
    
    func fireTrafficLight() {
        redOn()
    }
}

private extension TrafficLightViewModel {
    func redOn() {
        redLight.on()
        self.redLight.timerManager.startTimer({[weak self] _ in
            guard let self = self else {return}
            self.redLight.off()
            self.yellowOn()
        })
    }
    
    func yellowOn() {
        self.yellowLight.on()
        self.yellowLight.timerManager.startTimer({[weak self] direction in
            guard let self = self else {return}
            self.yellowLight.off()
            if direction == .down {
                self.yellowLight.timerManager.direction = .up
                self.greenOn()
            }else {
                self.yellowLight.timerManager.direction = .down
                self.redOn()
            }
        })
    }
    
    func greenOn() {
        self.greenLight.on()
        self.greenLight.timerManager.startTimer({[weak self] _ in
            self?.greenLight.off()
            self?.yellowOn()
        })
    }
}
