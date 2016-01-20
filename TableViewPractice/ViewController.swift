import UIKit

//add data source and delegate protocols
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    
    var superheros: [Superhero] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //setting the datasource and delegate
        myTableView.dataSource = self
        myTableView.delegate = self
        
        superheros.append(Superhero(Name: "Batman", Alias: "Bruce Wayne", Power: 100, Picture: UIImage(named: "batmanImage")!))
        superheros.append(Superhero(Name: "Superman", Alias: "Clark Kent", Power: 95, Picture: UIImage(named: "supermanImage")!))
        superheros.append(Superhero(Name: "Flash", Alias: "Barry Allen", Power: 90, Picture: UIImage(named: "flashImage")!))
        superheros.append(Superhero(Name: "Wonder Woman", Alias: "Diana", Power: 85, Picture: UIImage(named: "wonderWomanImage")!))
        superheros.append(Superhero(Name: "Scuba Steve", Alias: "Steve", Power: 5, Picture: UIImage(named: "scubaSteveImage")!))
        superheros.append(Superhero(Name: "Aquaman", Alias: "Arthur Curry", Power: 80, Picture: UIImage(named: "aquamanImage")!))
    }
   
    //allows you to add a superhero and their real name
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add Superhero", message: nil, preferredStyle: .Alert)
        
        //cancels action
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        //adds superheros and realnames to table view
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let superheroNameTextField = myAlert.textFields![0] as UITextField
            let aliasTextField = myAlert.textFields![1] as UITextField
            self.superheros.append(Superhero(Name: superheroNameTextField.text!, Alias: aliasTextField.text!))
          
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
    
    //allows you to edit table view
    @IBAction func editButton(sender: UIBarButtonItem)
    {
        myTableView.editing = !myTableView.editing
    }
    
    //creating a cell that will store the data
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myTableViewCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myTableViewCell.textLabel?.text = superheros[indexPath.row].name
        myTableViewCell.detailTextLabel?.text = superheros[indexPath.row].alias
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
        
            myTableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let superhero = superheros[sourceIndexPath.row]
        superheros.removeAtIndex(sourceIndexPath.row)
        superheros.insert(superhero, atIndex: destinationIndexPath.row)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailVC = segue.destinationViewController as! DetailViewController
        let selectedRow = myTableView.indexPathForSelectedRow?.row
        detailVC.superhero = superheros[selectedRow!]
    }
    
    
}