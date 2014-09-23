import Foundation
import CoreData

class PersonStore {
	
	var context:NSManagedObjectContext
	
	init(context:NSManagedObjectContext) {
		self.context = context
	}

	
	func addPerson(name:String, created:NSDate) -> Person {
	
		let entityDescription = NSEntityDescription.entityForName("Person", inManagedObjectContext: context)
		let person = Person(entity: entityDescription!, insertIntoManagedObjectContext: context)

		person.name = name
		person.created = created
		
		return person
		
	}
	
	func getAllPeople() -> (error: NSError?, people:[Person]?)  {
		
		let fetchRequest = NSFetchRequest()
		let entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: context)
		
		fetchRequest.entity = entity
		
		var error: NSError? = nil
		
		let people:[Person]? = context.executeFetchRequest(fetchRequest, error: &error) as [Person]?
		
		return (error, people)

	}
}