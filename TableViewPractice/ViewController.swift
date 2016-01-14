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
}

