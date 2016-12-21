//
//  AppDelegate.swift
//  Done
//
//  Created by LA Argon on 12/21/16.
//  Copyright © 2016 com.letsappit. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // Fetch main storyboard
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate Root Navigation Controller
        let rootNavigationController = mainStoryboard.instantiateViewControllerWithIdentifier("StoryboardIDRootNavigationController") as! UINavigationController
        
        // Configure View Controller
        let viewController = rootNavigationController.topViewController as? ViewController
        if let viewcontroller = viewController {
            viewcontroller.managedObjectContext = self.managedObjectModelContext
        }
        self.window?.rootViewController = rootNavigationController
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: Core Data Stack
    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelUrl = NSBundle.mainBundle().URLForResource("Done", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelUrl)!
    }()
    
    lazy var managedObjectModelContext: NSManagedObjectContext = {
        let persistantStoreCoordinator = self.persistantStoreCoordinator
        
        // Initialize managed object context
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        
        // Configure managed object context
        managedObjectContext.persistentStoreCoordinator = persistantStoreCoordinator
        return managedObjectContext
    }()

    lazy var persistantStoreCoordinator: NSPersistentStoreCoordinator = {
        // Initialize persistant store coordinator
        let persistantStoreCoordinator: NSPersistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        
        // URL Document directory
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let applicationDocumentDirectory = urls.first
        
        // URL persistant store
        let URLPersistentStore = applicationDocumentDirectory?.URLByAppendingPathComponent("Done.sqlite")
        
        do {
            // Add persistent to persisten store coordinator
            try persistantStoreCoordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: URLPersistentStore, options: nil)
        } catch {
            // Populate Error
            var userInfo = [String : AnyObject]()
            userInfo[NSLocalizedDescriptionKey] = "There was an error creating or loading the application's saved data."
            userInfo[NSLocalizedFailureReasonErrorKey] = "There was an error creating or loading the application's saved data."
            
            userInfo[NSUnderlyingErrorKey] = error as NSError
            let wrappeError = NSError(domain: "com.letsappit.Done", code: 1001, userInfo: userInfo)
            print("Unresolved Error \(wrappeError),  \(wrappeError.userInfo)")
            
            abort()
        }
        return persistantStoreCoordinator
    }()
}













