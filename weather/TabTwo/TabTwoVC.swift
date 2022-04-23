//
//  TabTwoVC.swift
//  weather
//
//  Created by disco on 19.04.2022.
//

import UIKit

class TabTwoVC: UIViewController {
	
	@IBOutlet private weak var collectionView: UICollectionView!
	@IBOutlet private weak var cityLable: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		cityLable.text = "Enter Location"
		createCollectionView()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		updateDescriptions()
		collectionView.reloadData()
		cityLable.text = WeatherService.shared.fetchedCity
	}
	
	private func updateDescriptions() {
		descriptionsList = [
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
	}
	
	private func createCollectionView() {
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellID")
		collectionView.collectionViewLayout = UICollectionViewFlowLayout()
	}
}

extension TabTwoVC: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
		cell.setupCell(with: descriptionsList[indexPath.row])
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return descriptionsList.count
	}
}

extension TabTwoVC: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 140, height: 170)
	}
}
