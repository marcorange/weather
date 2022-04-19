//
//  ViewController.swift
//  weather
//
//  Created by disco on 13.04.2022.
//

import UIKit
import Alamofire

class TabOneVC: UIViewController {
	
	@IBOutlet private weak var cityNameLabel: UILabel!
	@IBOutlet private weak var currentTempLabel: UILabel!
	@IBOutlet private weak var weatherDescriptionLabel: UILabel!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()

		WeatherService.shared.cityName = "Gurzuf"
		WeatherService.shared.fetchWeatherData {
			self.currentTempLabel.text = String(WeatherService.shared.currentTemp)
			self.cityNameLabel.text = WeatherService.shared.cityName
			self.weatherDescriptionLabel.text = String(WeatherService.shared.weatherDescription)
		}
	}
}
