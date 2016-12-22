//
//  AddTodoViewController.swift
//  Done
//
//  Created by LA Argon on 12/21/16.
//  Copyright © 2016 com.letsappit. All rights reserved.
//

import UIKit
import CoreData

class AddTodoViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var name = ""
    var managedObjectContext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let array = ["Iron Man", "Captain America", "Hunk", "Black Widow", "Thor", "Clint Barton"]
        let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
        
        name = array[randomIndex]
        nameLabel.text = name
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func doneButton(sender: AnyObject) {
        // Create Entity
        let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: self.managedObjectContext)
        
        // Initialize Record
        let record = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: self.managedObjectContext)
        
        // Populate Record
        record.setValue(name, forKey: "name")
        record.setValue(NSDate(), forKey: "createdAt")
        
        do {
            // save record
            try record.managedObjectContext?.save()
            
            // dismiss view controller
            self.dismissViewControllerAnimated(true, completion: nil)
        } catch let err as NSError {
            print("\(err), \(err.userInfo)")
            showAlertMessage("Warning", message: "Your to-do could not be saved.")
        }
    }
    
    private func showAlertMessage(title: String, message messsage: String) {
        let alert = UIAlertController(title: title, message: messsage, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .Cancel, handler: nil))
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
