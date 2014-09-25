//
//  FrazzleTests.swift
//  FrazzleTests
//
//  Created by Zac Tolley on 23/09/2014.
//  Copyright (c) 2014 Zac Tolley. All rights reserved.
//

import UIKit
import XCTest
import CoreData

class FrazzleTests: XCTestCase {
	
	let coreDataHelper = TestCoreDataHelper()
	var personStore:PersonStore!
	
	
	override func setUp() {
		personStore = PersonStore(context: self.coreDataHelper.managedObjectContext!)
	}
	
	
	func testAddPerson() {
		
		var person = personStore.addPerson("Fred", created: NSDate.date())

		XCTAssert(person.name == "Fred", "Check the new person object has the correct name")
		
	}
	
	func testCountPeople() {
		
		var count = 0
		let result = personStore.getAllPeople()
		
		count = result.people?.count ?? 0
		
		XCTAssert(count == 0, "Make sure the result collection has 1 result")

	}
	
	func testRetrievePerson() {
		
		personStore.addPerson("Fred", created: NSDate.date())
		
		let result = personStore.getAllPeople()
		
		if let people = result.people {
			XCTAssert(people[0].name == "Fred", "The first person is called fred")
		} else {
			XCTFail("No people returned")
		}
		
	}

}