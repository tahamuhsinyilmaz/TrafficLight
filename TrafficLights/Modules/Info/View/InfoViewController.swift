//
//  InfoViewController.swift
//  TrafficLights
//
//  Created by Taha  YILMAZ on 25.08.2021.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

private extension InfoViewController {
    func configureView() {
        title = AppStrings.infoPageTitle
    }
}
