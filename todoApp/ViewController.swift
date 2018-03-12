import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = Theme.Colors.DarkBackgroundColor.color
        tableView.backgroundColor = Theme.Colors.BackgroundColor.color
        view.backgroundColor = Theme.Colors.BackgroundColor.color
        tableView.tableFooterView = UIView()
        self.tableView.rowHeight = 70.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Books I Have Read"
        } else {
            return "Books I Will Read"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return bookListWillRead!.count
        }
        
        return bookListHaveRead!.count
        
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        //header.textLabel?.font = UIFont(name: "Damascus", size: 14)
        header.textLabel?.textColor = UIColor(red:0.97, green:0.9, blue:0, alpha:1)
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        // cell.pictureImageView.image = UIImage(named: ) //get image from somewhere
      
        
        if indexPath.section == 1 {
            if let blW = bookListWillRead {
                cell.textLabel?.text = blW[indexPath.item].title
            }
        } else {
            if let blH = bookListHaveRead {
                cell.textLabel?.text = blH[indexPath.item].title
            }
        }
        cell.layer.cornerRadius = 7.0
        cell.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0)
        cell.layer.masksToBounds = true
        cell.layer.borderWidth = 4.0
        let darkBorder = UIColor(hue:0.67, saturation:0.37, brightness:0.35, alpha:1)
        cell.layer.borderColor = darkBorder.cgColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if indexPath.section == 1 {
                bookListWillRead?.remove(at: indexPath.row)
            } else {
                bookListHaveRead?.remove(at: indexPath.row)
            }
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Segue to the second view controller
        self.performSegue(withIdentifier: "showView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showView" {
            let vc = segue.destination as! DetailsViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            let rowNum = indexPath!.row
            if indexPath?.section == 1 {
                vc.destinationMessage = bookListWillRead![rowNum].title
            } else {
                 vc.destinationMessage = bookListHaveRead![rowNum].title
            }
        }
    }
    
}
















