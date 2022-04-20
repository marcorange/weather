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
	@IBOutlet private weak var searchBar: UISearchBar!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		searchBar.delegate = self
	}
	
	private func loadWeatherData(forCity requestedCity: String) {
		WeatherService.shared.fetchWeatherData(forCity: requestedCity) {
			self.currentTempLabel.text = String(WeatherService.shared.currentTemp)
			self.cityNameLabel.text = WeatherService.shared.fetchedCity
			self.weatherDescriptionLabel.text = String(WeatherService.shared.weatherDescription)
			self.descriptionIcon.image = UIImage(named: WeatherService.shared.descriptionIconName)
		}
	}
}

extension TabOneVC: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		guard let citySearched = searchBar.text else { return }
		loadWeatherData(forCity: citySearched)
	}
	
	func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
		searchBar.text = nil
	}
	
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		searchBar.text = nil
		searchBar.resignFirstResponder()
	}
}
