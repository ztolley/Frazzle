//
//  AppDelegate.swift
//  Frazzle
//
//  Created by Zac Tolley on 23/09/2014.
//  Copyright (c) 2014 Zac Tolley. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	var coreDataHelper: CoreDataHelper!
	
	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		
		self.coreDataHelper = CoreDataHelper()
		
		let navigationController = self.window!.rootViewController as UINavigationController
		let controller = navigationController.topViewController as MasterViewController
		
		controller.managedObjectContext = coreDataHelper.managedObjectContext
		return true
	}

	func applicationWillTerminate(application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
		// Saves changes in the application's managed object context before the application terminates.
		coreDataHelper.saveContext()
	}

}

