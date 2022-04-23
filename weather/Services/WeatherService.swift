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
	var descriptionIconName = ""
	
	var currentTemp = 0.0
	var tempFeelsLike = 0.0
	var tempMin = 0.0
	var tempMax = 0.0
	var pressure = 0.0
	var humidity = 0.0
	
	var windSpeed = 0.0
	
	var timezone = 0
	var sunriseTime = ""
	var sunsetTime = ""
	
	var fetchedCity = ""
	
	func fetchWeatherData(forCity cityName: String, completion: @escaping () -> ()) {
		let url = "https://api.openweathermap.org/data/2.5/weather"
		let apiKey = "fcab6dfb7a165ced098153f4f57903fc"
		let parameters: Parameters = [ "q": cityName,
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
		setDescriptionIcon(weatherDescriptionIconID)
		
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
		
		self.timezone = data.timezone
		self.sunriseTime = convertTime(data.sys.sunrise)
		self.sunsetTime = convertTime(data.sys.sunset)
		
		self.fetchedCity = data.name
	}
	
	private func convertTime(_ timeUnix: Int) -> String {
		let date = Date(timeIntervalSince1970: TimeInterval(timeUnix))
		let dateFormatter = DateFormatter()
		dateFormatter.timeStyle = .short
		// как отображать в местном времени
		return (dateFormatter.string(from: date))
	}
	
	private func setDescriptionIcon(_ id: Int) {
		if id / 100 == 2 {
			descriptionIconName = "Thunderstorm"
		}
		if id / 100 == 3 || id / 100 == 5 {
			descriptionIconName = "Rain"
		}
		if id / 100 == 6 {
			descriptionIconName = "Snow"
		}
		if id / 100 == 7 {
			descriptionIconName = "Atmosphere"
		}
		if id / 100 == 8 {
			if id == 800 {
				descriptionIconName = "Clear"
			}
			else {
				descriptionIconName = "Clouds"
			}
		}
	}
}

