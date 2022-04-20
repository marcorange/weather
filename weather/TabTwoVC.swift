//
//  TabTwoVC.swift
//  weather
//
//  Created by disco on 19.04.2022.
//

import UIKit

class TabTwoVC: UIViewController {
	
	@IBOutlet private var pressureLable: UILabel!
	@IBOutlet private var cityNameLable: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		loadWeatherData()
	}
	
	private func loadWeatherData() {
		pressureLable.text = String(WeatherService.shared.pressure)
		self.cityNameLable.text = WeatherService.shared.fetchedCity
	}
}

