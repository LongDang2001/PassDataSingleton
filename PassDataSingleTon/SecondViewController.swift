

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var myTextFieldSecond: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if singleTon.all.dataTextSecond != nil {
            myTextFieldSecond.text = singleTon.all.dataTextSecond
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        singleTon.all.dataTextSecond = myTextFieldSecond.text
    }
    // dùng sington... = mytextFieldSecond.text thì khi mk khai báo thằng a = mytextFieldSecond thì không khai báo đc nữa.
}
