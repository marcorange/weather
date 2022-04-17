//
//  ViewController.swift
//  weather
//
//  Created by disco on 13.04.2022.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var cityNameLabel: UILabel!
	@IBOutlet weak var currentTempLabel: UILabel!
	@IBOutlet weak var weatherDescriptionLabel: UILabel!
	
	let weatherService = WeatherService.shared
	
	override func viewDidLoad() {
		super.viewDidLoad()
		weatherService.fetchWeatherData(forCity: "Moscow")
		
		cityNameLabel.text = weatherService.cityName
		currentTempLabel.text = String(weatherService.currentTemp)
		weatherDescriptionLabel.text = weatherService.weatherDescription
		
	}
	
}

