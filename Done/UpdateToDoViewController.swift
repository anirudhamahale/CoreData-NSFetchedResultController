//
//  UpdateToDoViewController.swift
//  Done
//
//  Created by LA Argon on 12/21/16.
//  Copyright © 2016 com.letsappit. All rights reserved.
//

import UIKit
import CoreData

class UpdateToDoViewController: UIViewController {

    var record: NSManagedObject!
    var managedObjectContext: NSManagedObjectContext!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = record.valueForKey("name") as? String {
            textField.text = name
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func save(sender: AnyObject) {
        let name = textField.text
        if let isEmpty = name?.isEmpty where isEmpty == false {
            // update record
            record.setValue(name, forKey: "name")
            
            do {
                // save record
                try record.managedObjectContext?.save()
                
                // dismiss the view controller
                navigationController?.popViewControllerAnimated(true)
            } catch let err as NSError {
                print("\(err), \(err.userInfo)")
                showAlertMessage("Warning", message: "Your to-do could not be saved.")
            }
        } else {
            showAlertMessage("Warning", message: "Your to-do needs a name.")
        }
    }
    
    private func showAlertMessage(title: String, message msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
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
