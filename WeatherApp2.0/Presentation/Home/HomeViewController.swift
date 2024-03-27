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
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var getWeatherInfoButton: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loader.isHidden = true
    }
    
    // MARK: - IB Actions
    
    @IBAction func getWeatherInfo(_ sender: UIButton) {
        
        self.enableLoaderAndStartOrStopAnimatingIfNeeded(true)
        guard let name = locationTextField.text else {
            return
        }
        cityName = name
        loadWeatherInfo(for: cityName)
    }
    
    func enableLoaderAndStartOrStopAnimatingIfNeeded(_ isNeeded: Bool) {
        loader.isHidden = !isNeeded
        isNeeded ? loader.startAnimating() : loader.stopAnimating()
    }
    
    // MARK: -
    
    private func loadWeatherInfo(for city: String) {
        Task {
            await viewModel.getWeather(for: city)
            self.enableLoaderAndStartOrStopAnimatingIfNeeded(false)
            
            guard let report = viewModel.weatherReport else {
                return
            }
            self.navigationController?.pushViewController(DetailsViewController.instantiate(with: report), animated: true)
        }
    }
}
