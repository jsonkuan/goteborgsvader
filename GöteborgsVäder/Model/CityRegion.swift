//
//  CityRegion.swift
//  GöteborgsVäder
//
//  Created by Jason Kuan on 2018-03-10.
//  Copyright © 2018 Jason Kuan. All rights reserved.
//

import Foundation

struct CityRegion {
	
	let majorna = Location.init(name: "Majorna", latitude: 59.6918, longitude: 11.9253)
	let mölndal = Location.init(name: "Mölndal", latitude: 64.6552, longitude: -150.0166)
	let hissingen = Location.init(name: "Hissingen", latitude: -90.00, longitude: 0.00)
	let kåltorp = Location.init(name: "Kåltorp", latitude: 26.6552, longitude: 29.0166)
	let linne = Location.init(name: "Linne", latitude: 60.6552, longitude: 105.0166)
	
	let allRegions = [Location.init(name: "Majorna", latitude: 59.6918, longitude: 11.9253),
					  Location.init(name: "Mölndal", latitude: 64.6552, longitude: -150.0166),
					  Location.init(name: "Hissingen", latitude: -90.00, longitude: 0.00),
					  Location.init(name: "Kåltorp", latitude: 26.6552, longitude: 29.0166),
					  Location.init(name: "Linne", latitude: 60.6552, longitude: 105.0166)]
}
