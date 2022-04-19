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

		pressureLable.text = String(WeatherService.shared.pressure)
		cityNameLable.text = WeatherService.shared.cityName
    }

}
