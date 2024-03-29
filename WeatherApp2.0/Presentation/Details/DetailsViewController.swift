//
//  DetailsViewController.swift
//  WeatherApp2.0
//
//  Created by waheedCodes on 11/03/2024.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tempInfoLabel: UILabel!
    
    var weatherDescription: String!
    var temp: String!

    // MARK: - Initializers
    
    internal static func instantiate(with weatherInfo: WeatherInfo) -> DetailsViewController {

        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: DetailsViewController.storyboardIdentifier) as! DetailsViewController
        
        vc.weatherDescription = weatherInfo.description
        vc.temp = weatherInfo.temp
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        descriptionLabel.text = weatherDescription.description.capitalized
        tempInfoLabel.text = temp
    }
}
