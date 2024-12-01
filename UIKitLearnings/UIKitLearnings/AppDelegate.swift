//
//
// AppDelegate.swift
// UIKitLearnings
//
// Created by Saurabh Verma on 15/04/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//

import UIKit
import CoreData
import OSLog

/**
 `@main`
 Any program in any language needs an entry point. The entry point from where any program logically will start
 execution. Different lanugages have different ways. For eg.
 
 In Java we have `main()` function defines as :
 ```public static void main(String args[])```
 
 In Python we have `__main__`
 
 In Objective C there used to be concept of a main.m file which used to define an entry point method as
 ```int main(int argc, char *argv[])```
 This actually used to call function `UIApplicationMain(_:_:_:_:)`
 
 `UIApplicationMain(_:_:_:_:)`
 `UIApplicationMain(_:_:_:_:)` creates the application object, application delegate and sets up the event
 cycle.
 
 `Return type of UIApplicationMain(_:_:_:_:) is defined as Int32, what are the values it returns?`
 `UIApplicationMain(_:_:_:_:)` never returns. When user exits application, the application moves to background.
 
 `Responsibilities of UIApplicationMain(_:_:_:_:)`
 1. Instantiates application object from principal class (UIApplication or it's subclass)
 2. Instantiates a delegate object and sets delegate object for the application object
 3. Sets up the main event loop, including application's run loop and starts processing events.
 4. If a main nib file is specified in application's Info.plist file then it will load that nib.
 5. Even though there is return type, this function NEVER returns.
 
 Now so usually all main.m used to need was what's the application's principal class and the delegate class.
 There is hardly any rare reasons for subclassing UIApplication so even most of the time it's only delegate class
 which is required to be setup. So main.m qualifies to be a boilerplate code which is mostly the same and can be
 used without much customisation in most of the cases.
 
 So to do away with implementing main.m, some attributes were introduced :

 `@UIApplicationMain`
 `@NSApplicationMain`
 
 These used to mark the entry point for iOS or macOS applications.
 Later on with Swift 5.3 a new attribute `@main` was introduced which became a general purpose way of adding
 attribute and marking entry point.
 
 When `@main` attribute is used on a struct, class or enum then that struct, class or enum is expected to provide
 a maintype function having no arguments and returning void.
 
 Now usually application delegate is marked with `@main` attribute as we can see in class declaration for `AppDelegate`
 but there is no `main()` method defined anywhere. This is because a default implementation of `main()`
 method is provided in an extension to protocol `UIApplicationDelegate` causing any aaplication delegate
 we define for our application to receive this default implementation and mostly it's what all is required.
 ```
 extension UIApplicationDelegate {
     @MainActor public static func main()
 }
 ```
 
 So now with an AppDelegate marked with `@main` tells system to call `AppDelegate.main()` function at
 launch, which is equivalent to having a main.m file.
 
 Now suppose there is a swift command line program so there can be two approaches to provide entry point
 
 `Option 1 : main.m`
 
 ```
 // This is defined in main.m file
 struct MySwiftCommandLineProgram {
   static func main() {
       Logger.appLifeCycle.info("This is command line program")
   }
 }
 
 MySwiftCommandLineProgram.main()
 ```
 
 `Option 2 : @main`
 
 ```
 @main
 struct MySwiftCommandLineProgram {
   static func main() {
       Logger.appLifeCycle.info("This is command line program")
   }
 }
 ```
 
 
 */
// TODO: https://useyourloaf.com/blog/what-does-@main-do-in-swift-5.3/
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Logger.appLifeCycle.info("Application didFinishLaunchingWithOptions")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "UIKitLearnings")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

