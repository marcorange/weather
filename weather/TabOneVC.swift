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
	
	@IBOutlet private weak var descriptionIcon: UIImageView!
	@IBOutlet private weak var searchCItyBar: UISearchBar!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		WeatherService.shared.cityName = "Cape Town"
		WeatherService.shared.fetchWeatherData {
			self.currentTempLabel.text = String(WeatherService.shared.currentTemp)
			self.cityNameLabel.text = WeatherService.shared.cityName
			self.weatherDescriptionLabel.text = String(WeatherService.shared.weatherDescription)
			self.setDescriptionIcon()
		}
	}

	private func setDescriptionIcon() {
		let id = WeatherService.shared.weatherDescriptionIconID
		
		if id / 100 == 2 {
			descriptionIcon.image = UIImage(named: "Thunderstorm")
		}
		if id / 100 == 3 || id / 100 == 5 {
			descriptionIcon.image = UIImage(named: "Rain")
		}
		if id / 100 == 6 {
			descriptionIcon.image = UIImage(named: "Snow")
		}
		if id / 100 == 7 {
			descriptionIcon.image = UIImage(named: "Atmosphere")
		}
		if id / 100 == 8 {
			if id == 800 {
				descriptionIcon.image = UIImage(named: "Clear")
			}
			else {
				descriptionIcon.image = UIImage(named: "Clouds")
			}
		}
	}
}
