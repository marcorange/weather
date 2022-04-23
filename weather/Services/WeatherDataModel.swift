//
//  WeatherData.swift
//  weather
//
//  Created by disco on 16.04.2022.
//

import Foundation

struct Weather: Decodable {
	let id: Int
//	let main: String
	let description: String
}

struct Sys: Decodable {
	let sunrise: Int
	let sunset: Int
}

struct WeatherDataModel: Decodable {
	let weather: [Weather]
	let main: [String: Double]
	let wind: [String: Double]
	let sys: Sys
	let timezone: Int
	let name: String
}

struct Description {
	let title: String
	let iconName: String
	let value: String
}

var descriptionsList: [Description] = [
	Description(title: "Current Temperature", iconName: "Thermometer", value: String(Int(round(WeatherService.shared.currentTemp))) + "°C"),
	Description(title: "Feels Like", iconName: "Thermometer", value: String(Int(round(WeatherService.shared.tempFeelsLike))) + "°C"),
	Description(title: "Min temperature", iconName: "Thermometer", value: String(Int(round(WeatherService.shared.tempMin))) + "°C"),
	Description(title: "Max temperature", iconName: "Thermometer", value: String(Int(round(WeatherService.shared.tempMax))) + "°C"),
	Description(title: "Pressure", iconName: "Pressure", value: String(Int(round(WeatherService.shared.pressure))) + "hPa"),
	Description(title: "Humidity", iconName: "Humidity", value: String(Int(round(WeatherService.shared.humidity))) + "%"),
	Description(title: "Wind Speed", iconName: "Wind", value: String(Int(round(WeatherService.shared.windSpeed))) + "m/s"),
	Description(title: "Sunrise Time", iconName: "Sunrise", value: WeatherService.shared.sunriseTime),
	Description(title: "Sunset Time", iconName: "Sunset", value: WeatherService.shared.sunsetTime)
]
