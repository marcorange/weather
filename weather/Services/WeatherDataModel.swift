//
//  WeatherData.swift
//  weather
//
//  Created by disco on 16.04.2022.
//

import Foundation

struct Weather: Decodable {
	let id: Int
	let main: String
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
	let clouds: [String: Int]
	let dt: Int
	let sys: Sys
	let name: String
}

