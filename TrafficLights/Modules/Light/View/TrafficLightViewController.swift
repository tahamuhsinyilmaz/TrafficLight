//
//  TrafficLightViewController.swift
//  TrafficLights
//
//  Created by Taha  YILMAZ on 25.08.2021.
//

import UIKit

class TrafficLightViewController: UIViewController {
    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    
    private enum Constants {
        static let title: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String
        static let offLightColor: UIColor = .systemBackground
    }
    
    private let viewModel: TrafficLightViewModel
    
    init(viewModel: TrafficLightViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        bindViewModel()
        viewModel.fireTrafficLight()
    }

    func bindViewModel() {
        viewModel.bind {[unowned self] change in
            switch change {
            case .lightChange(let light):
                switch light.color {
                case .red:
                    if light.isOn {
                        self.redLightView.backgroundColor = light.color
                    }else {
                        self.redLightView.backgroundColor = Constants.offLightColor
                    }
                case .yellow:
                    if light.isOn {
                        self.yellowLightView.backgroundColor = light.color
                    }else {
                        self.yellowLightView.backgroundColor = Constants.offLightColor
                    }
                case .green:
                    if light.isOn {
                        self.greenLightView.backgroundColor = light.color
                    }else {
                        self.greenLightView.backgroundColor = Constants.offLightColor
                    }
                default:
                    return
                }
            }
        }
    }
}

//MARK: - View Configuration
private extension TrafficLightViewController {
    func configureView() {
        setNavBar()
        setNavTitle()
    }
    
    func setNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks,
                                                            target: self,
                                                            action: #selector(infoButtonAction))
    }
    
    func setNavTitle() {
        title = Constants.title
    }
}

//MARK: - Action Methods
private extension TrafficLightViewController {
    @objc
    func infoButtonAction() {
        viewModel.proceedToInfo()
    }
}


