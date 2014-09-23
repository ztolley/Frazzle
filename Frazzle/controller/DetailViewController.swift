//
//  DetailViewController.swift
//  Frazzle
//
//  Created by Zac Tolley on 23/09/2014.
//  Copyright (c) 2014 Zac Tolley. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

	@IBOutlet weak var detailDescriptionLabel: UILabel!


	var detailItem: Person? {
		didSet {
		    // Update the view.
		    self.configureView()
		}
	}

	func configureView() {
		// Update the user interface for the detail item.
		if let detail: Person = self.detailItem {
		    if let label = self.detailDescriptionLabel {
		        label.text = detail.name
		    }
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.configureView()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

