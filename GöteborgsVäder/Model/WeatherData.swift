//
//  weatherData.swift
//  GöteborgsVäder
//
//  Created by Jason Kuan on 2018-03-08.
//  Copyright © 2018 Jason Kuan. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
	
	let latitude: Double
	let currently: CurrentWeather
	
}
