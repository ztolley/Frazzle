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
	
    func testSimplePerson() {
		
		self.addPerson("Fred")
		
		let context = self.coreDataHelper.managedObjectContext!
		
		let fetchRequest = NSFetchRequest()
		fetchRequest.entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: context)
		
		var error: NSError? = nil
		
		let people = context.executeFetchRequest(fetchRequest, error: &error) as [Person]?
		let firstPerson = people![0]
		
		XCTAssert(firstPerson.name == "Fred" , "Testing getting stuff")
	}
	
	
	func addPerson(name:String) -> Person {
		let context = self.coreDataHelper.managedObjectContext!
		
		let entityDescription = NSEntityDescription.entityForName("Person", inManagedObjectContext: context)
		let person = Person(entity: entityDescription!, insertIntoManagedObjectContext: context)
		
		person.name = name
		person.created = NSDate.date()
		
		return person
	}
	
    

    
}
