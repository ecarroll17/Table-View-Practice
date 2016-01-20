import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet var myImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var aliasTextField: UITextField!
    @IBOutlet weak var powerTextField: UITextField!

    var superhero: Superhero!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameTextField.text! = superhero.name //segues data into var
        aliasTextField.text! = superhero.alias
        powerTextField.text! = String(superhero.power)
        myImageView.image = superhero.picture
    }
    @IBAction func saveButtonTapped(sender: UIButton)
    {
        superhero.name = nameTextField.text!
        superhero.alias = aliasTextField.text!
        superhero.power = Int(powerTextField.text!)!
    }
}
