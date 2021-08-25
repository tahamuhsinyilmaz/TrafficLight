//
//  AppRouter.swift
//  TrafficLights
//
//  Created by Taha  YILMAZ on 25.08.2021.
//

import Foundation

final class AppRouter {
    private init() {}
    static let shared = AppRouter()
    
    var navigationController: MainNavigationController?
    
    func addTrafficLight() {
        let viewModel = TrafficLightViewModel()
        let lightViewController = TrafficLightViewController(viewModel: viewModel)
        navigationController?.viewControllers.append(lightViewController)
    }
    
    func proceedToInfo() {
        let infoViewController = InfoViewController()
        navigationController?.pushViewController(infoViewController, animated: true)
    }
    
    
}
