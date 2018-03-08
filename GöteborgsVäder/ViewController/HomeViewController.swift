//
//  HomeViewController.swift
//  GöteborgsVäder
//
//  Created by Jason Kuan on 2018-03-08.
//  Copyright © 2018 Jason Kuan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

	@IBOutlet weak var weatherIcon: UIImageView!
	@IBOutlet weak var weatherLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let handler = NetworkHandler()
		handler.getWeatherData(lat: 57.7089, long: 11.9746) { data in
			print("Lat: \(data.latitude)")
			print("Summary: \(data.currently.summary)")
		}
		
	}

}

