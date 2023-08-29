

import UIKit
import FirebaseAuth
import Toast

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
}
//MARK: - RegisterViewControllerButton

extension RegisterViewController{
    
    @IBAction func registerPressed(_ sender: UIButton) {
        let eMail=emailTextfield.text!
        let password=passwordTextfield.text!
        // Firebase Register Action
        Auth.auth().createUser(withEmail:eMail , password: password){
            authResult,errorr in
            if let e = errorr{
                let toast=Toast.text("Invalid values")
                toast.show()
            }
            else{
                //Go To ChatViewController
                self.performSegue(withIdentifier: k.registerSegue, sender: self)
            }
        }
    }
}
