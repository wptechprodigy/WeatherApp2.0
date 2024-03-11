//
//  ViewController.swift
//  WeatherApp
//
//  Created by waheedCodes on 11/03/2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var getWeatherInfoButton: UIButton!
    
    // MARK: -
    
    var viewModel: HomeViewModel!
    
    var cityName: String = ""
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.viewModel = HomeViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IB Actions
    
    @IBAction func getWeatherInfo(_ sender: UIButton) {
        guard let name = locationTextField.text else {
            return
        }
        
        cityName = name
        loadWeatherInfo(for: cityName)
    }
    
    // MARK: -
    
    private func loadWeatherInfo(for city: String) {
        Task {
            try await viewModel.getWeather(for: city)
        }
    }
}
