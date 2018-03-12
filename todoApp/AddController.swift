import UIKit
import DTTextField

class AddController: UIViewController {

    @IBOutlet weak var bookTextField: DTTextField!
    //@IBOutlet weak var textField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var segmentValue: String! = "Have"
     let bookErrorMessage = "Book Name Required"
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            segmentValue = "Have";
        case 1:
            segmentValue = "Will";
        default:
            break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addPressed(_ sender: UIButton) {
        if(bookTextField.text == nil || bookTextField.text == "") {
            bookTextField.showError(message: bookErrorMessage)
        }
        if (bookTextField.text != nil) && bookTextField.text != "" {
            if segmentValue == "Have" {
                bookListHaveRead?.append(Info(image: "", title: bookTextField.text!, availability: false, description: "", rating: -1))
            } else {
                bookListWillRead?.append(Info(image: "", title: bookTextField.text!, availability: false, description: "", rating: -1))
            }
            bookTextField.text = ""
            bookTextField.placeholder = "Type another book to add?"
        }
        
        
    }

}


