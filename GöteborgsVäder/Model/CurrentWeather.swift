//
//  CurrentWeather.swift
//  GöteborgsVäder
//
//  Created by Jason Kuan on 2018-03-08.
//  Copyright © 2018 Jason Kuan. All rights reserved.
//

import Foundation

struct CurrentWeather: Codable {

	let summary: String
	let icon: String
	let temperature: Double
	let precipProbability: Double
}
