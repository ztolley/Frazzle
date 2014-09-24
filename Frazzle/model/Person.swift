//
//  Person.swift
//  Frazzle
//
//  Created by Zac Tolley on 23/09/2014.
//  Copyright (c) 2014 Zac Tolley. All rights reserved.
//

import Foundation
import CoreData

@objc(Person)
public class Person: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var created: NSDate

}
