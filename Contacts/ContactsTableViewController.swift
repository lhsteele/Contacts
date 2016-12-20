//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Lisa Steele on 12/1/16.
//  Copyright © 2016 Lisa Steele. All rights reserved.
//

// Although the course tells you to use a class, this is a perfect example of when a structure can work better. This is because a structure is the data itself, it is a stand alone entity. When it is changed in one place, it is changed everywhere else in the code.
// ***In order for this change to be visible onscreen, you must trigger a refresh

// Also, if using a struct, don't need to initialise with "nil" as the course does.

import UIKit

class ContactsTableViewController: UITableViewController {
  
    struct Contact {
        var name: String?
        var address: String?
        var email: String?
        
    }
    
// struct means we don't need to initialise
    
// var lisa = Contact(name: "Lisa", address: "123 Mulberry St", email: "lisa@email.com") - don't need this
    
// lisa as created above is a property in the Contact class. 
// at this point, this doesn't sit in a func so can't reference it - it's just sitting within the Contact class. If we want to reference it, it needs to sit within a function, for example within the viewDidLoad function below.
    
var contactArray = [Contact(name: "Lisa", address: "123 Mulberry St", email: "lisa@email.com"),
                    Contact(name: "Jack", address: "123 Post St", email: "jack@email.com"),
                    Contact(name: "Jill", address: nil, email: nil )
    ]
    
 
// because the objects in class Contact above were defined as optionals (String?), we can pass in nil values (but the actual value nil, in purple, as opposed to "nil"). The program isn't expecting an input value for every object in the class. If they weren't optionals, we would have to pass in an input value for each object.
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contactArray.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath)

        // Configure the cell...
        
       let contact = contactArray[indexPath.row]
        
        cell.textLabel?.text = contact.name
       

        return cell
    }
    
// indexPath is an already written in for loop. "indexPath" refers to the section. For example, in the Contacts app on the phone, each letter is a section. "A" would have an indexPath of 0. "B" would be 1, "C" would be 2, etc. the .row portion refers to which row of that section. The first entry in "A" would be (indexPath)0.(row)0. The second entry would be 0.1, and the third entry 0.3, etc.
// indexPath as written above knows (because of prewritten code behind it) to iterate through each item in the section, in index order. So, in this example, will go from the first indexed entry in the arry, to the next, etc.
    
// don't need to have two separate lines of code - could be written as one, to say cell.textLabel?.text = contactArray[indexPath.row].name
// dot syntax - contact.name - is a way of retrieving a variable within a class.
// so the above: cell.textLabel?.text = contact.name is telling the program to retrieve the "name" from the array and print it in each row.

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    //}
    

}
