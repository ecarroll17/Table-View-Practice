import UIKit
//add data source and delegate protocols
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    
    var superheros = ["Batman", "Wonder Woman", "Superman", "Flash", "Aquaman", "Scuba Steve"]
    var realNames = ["Bruce Wayne", "Diana", "Clark Kent", "Barry Allen", "Arthur Curry", "Steve"]
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //setting the datasource and delegate
        myTableView.dataSource = self
        myTableView.delegate = self
    }
   
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add Superhero", message: nil, preferredStyle: .Alert)
        
        //cancels action
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        //adds superheros and realnames to table view
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let superheroNameTextField = myAlert.textFields![0] as UITextField
            let aliasTextField = myAlert.textFields![0] as UITextField
            self.superheros.append(superheroNameTextField.text!)
            self.realNames.append(aliasTextField.text!)
            self.myTableView.reloadData()
        }
        
        myAlert.addAction(addAction)
        
        myAlert.addTextFieldWithConfigurationHandler { (superheroTextField) -> Void in
            superheroTextField.placeholder = "Add Superhero Name"
        }
        myAlert.addTextFieldWithConfigurationHandler { (aliasTextField) -> Void in
            aliasTextField.placeholder = "Add Real Name"
        }
        
        //presents alert
        self.presentViewController(myAlert, animated: true, completion: nil)
        
        
    }
    
    //creating a cell that will store the data
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myTableViewCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myTableViewCell.textLabel?.text = superheros[indexPath.row]
        myTableViewCell.detailTextLabel?.text = realNames[indexPath.row]
        return myTableViewCell
    }
    
    //sets the number of rows in the tableview
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return superheros.count
    }
    
    //allows you to delete rows from the tableview
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            superheros.removeAtIndex(indexPath.row)
            realNames.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }
}

