//
//  PersonStoreSpec.swift
//  Frazzle
//
//  Created by Zac Tolley on 24/09/2014.
//  Copyright (c) 2014 Zac Tolley. All rights reserved.
//

import Quick
import Nimble

class PersonStoreSpec: QuickSpec {
	override func spec() {
		describe("The Person Store") {
			
			var personStore:PersonStore!
			var cdh:TestCoreDataHelper!
			
			context("which contains a person") {
			
				beforeEach {
					cdh = TestCoreDataHelper()
					personStore = PersonStore(context: cdh.managedObjectContext!)
				
					personStore.addPerson("Fred", created: NSDate.date())
				
				}
				
				it("returns a single person when asked for a collection") {
					
					var count = 0
					let result = personStore.getAllPeople()
					
					count = result.people?.count ?? 0
					
					expect(count).to(equal(1))

				}
				it("returns a Person object in a collection with the correct name") {
					
					let result = personStore.getAllPeople()
					
					let firstPerson = result.people?[0]
					let name = firstPerson?.name

					expect(name).to(equal("Fred"))
				}
			}
		}
	}
}
