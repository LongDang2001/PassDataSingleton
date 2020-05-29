

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    var indexLocal: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        indexLocal = nil
        myTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return singleTon.all.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IDCell", for: indexPath)
        cell.textLabel?.text = singleTon.all.array[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secondviewcontroller = segue.destination as? SecondViewController {
            if let index = myTableView.indexPathForSelectedRow {
                singleTon.all.dataTextSecond = singleTon.all.array[index.row]
                        myTableView.reloadData()
                    }
            //        // set text tittle cho button(Back)
            //        let titleTextButton = UIBarButtonItem()
            //        titleTextButton.title = "ExitView"
            //        self.navigationController?.navigationBar.topItem?.backBarButtonItem = titleTextButton
                }
        }
        
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexLocal = indexPath.row
        myTableView.reloadData()
    }
    
    // dùng sington thig không thấy reloadData được, 
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
//        if let passDataUnwind = unwindSegue.source as? SecondViewController {
//            if let index = myTableView.indexPathForSelectedRow {
//
//            }
//        }
        
        if indexLocal != nil {
            guard let dataEdit = singleTon.all.dataTextSecond else { return }
            if dataEdit.trimmingCharacters(in: .whitespaces).isEmpty {
            } else {
                singleTon.all.array[indexLocal!] = dataEdit
            }
        } else {
            guard let dataAdd = singleTon.all.dataTextSecond else { return }
            if dataAdd.trimmingCharacters(in: .whitespaces).isEmpty {
            } else {
                singleTon.all.array.append(dataAdd)
            }
        }
        myTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            singleTon.all.array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

