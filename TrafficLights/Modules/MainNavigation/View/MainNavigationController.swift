//
//  MainNavigationController.swift
//  TrafficLights
//
//  Created by Taha  YILMAZ on 25.08.2021.
//

import UIKit


class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}


private extension MainNavigationController {
    func configureView() {
        AppRouter.shared.navigationController = self
        AppRouter.shared.addTrafficLight()
    }
}
