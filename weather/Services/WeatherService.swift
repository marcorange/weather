//
//  WeatherService.swift
//  weather
//
//  Created by disco on 15.04.2022.
//

import Foundation
import Alamofire

class WeatherService {
	
	static let shared = WeatherService()
	
	private init() {}
	
	var weatherDescription = ""
	var weatherDescriptionIconID = 0
	
	var currentTemp = 0.0
	var tempFeelsLike = 0.0
	var tempMin = 0.0
	var tempMax = 0.0
	var pressure = 0.0
	var humidity = 0.0
	
	var windSpeed = 0.0
	
	var cloudiness = 0
	
	var calcTime = 0
	
	var sunriseTime = 0
	var sunsetTime = 0
	
	var cityName = ""
	
	// validateCity() ?
	func fetchWeatherData(completion: @escaping () -> ()) {
		let url = "https://api.openweathermap.org/data/2.5/weather"
		let apiKey = "fcab6dfb7a165ced098153f4f57903fc"
		let parameters: Parameters = [ "q": self.cityName,
									   "units": "metric",
									   "appid": apiKey ]
		
		AF.request(url, method: .get, parameters: parameters)
			.validate()
			.responseDecodable(of: WeatherDataModel.self) { response in
				guard let fetchedData = response.value else { return }
				self.parseWeatherData(fetchedData)
				completion()
			}
	}
	
	private func parseWeatherData(_ data: WeatherDataModel) {
		self.weatherDescription = data.weather[0].description
		self.weatherDescriptionIconID = data.weather[0].id
		
		guard let temp = data.main["temp"] else { return }
		self.currentTemp = temp
		guard let feelsLike = data.main["feels_like"] else { return }
		self.tempFeelsLike = feelsLike
		guard let min = data.main["temp_min"] else { return }
		self.tempMin = min
		guard let max = data.main["temp_max"] else { return }
		self.tempMax = max
		guard let pressure = data.main["pressure"] else { return }
		self.pressure = pressure
		guard let humidity = data.main["humidity"] else { return }
		self.humidity = humidity
		
		guard let speed = data.wind["speed"] else { return }
		self.windSpeed = speed
		
		guard let clouds = data.clouds["all"] else { return }
		self.cloudiness = clouds
		
		self.calcTime = data.dt
		
		self.sunriseTime = data.sys.sunrise
		self.sunsetTime = data.sys.sunset
		
		self.cityName = data.name
	}
}

