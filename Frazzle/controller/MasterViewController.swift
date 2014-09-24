//
//  MasterViewController.swift
//  Frazzle
//
//  Created by Zac Tolley on 23/09/2014.
//  Copyright (c) 2014 Zac Tolley. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UIViewController {

	var personStore: PersonStore!
	
	func setCdh(cdh: CoreDataHelper) {
		personStore = PersonStore(context: cdh.managedObjectContext!)
	}
	

	@IBOutlet weak var countLabel: UILabel!
	@IBOutlet weak var nameLabel: UILabel!
	
	@IBAction func pressButton(sender: AnyObject) {
		
		countLabel.text = "Adding"
		
		personStore.addPerson("Fred", created:NSDate.date())
		
		self.updateTotal()
		self.showFirstPerson()
		
	}

	
	func updateTotal() {

		var count = 0
		let result = personStore.getAllPeople()

		count = result.people?.count ?? 0
		
		countLabel.text = "Curent Count: \(count)"

	}
	
	func showFirstPerson() {
		
		let result = personStore.getAllPeople()
		
		let firstPerson = result.people?[0]
		nameLabel.text = firstPerson?.name
	
	}
	
	
	
}

