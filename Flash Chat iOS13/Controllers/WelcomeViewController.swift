

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        //Start Animation
        var t=0.0
        titleLabel.text=""
        let tiltel = k.appName
        for lett in tiltel{
            Timer.scheduledTimer(withTimeInterval: 0.05*t, repeats: false) { (timer) in
                self.titleLabel.text?.append(lett)
            }
            t += 1
            
        }
        super.viewDidLoad()
    }
}
//MARK: - WelcomeViewControllerButton

extension WelcomeViewController{
    @IBAction func registerButton(_ sender: UIButton) {
        // Go To RegisterViewController
        performSegue(withIdentifier: k.gotoregister, sender: self)
       
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        // Go To LoginViewController
        performSegue(withIdentifier: k.gotologin, sender: self)
    }
   
    
}
