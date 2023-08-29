

import UIKit
import FirebaseAuth
import Toast

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
}

//MARK: - LoginViewControllerButton
extension LoginViewController{
    
    @IBAction func loginPressed(_ sender: UIButton) {
        let eMail=emailTextfield.text!
        let password = passwordTextfield.text!
        //Firebase Login Section
        Auth.auth().signIn(withEmail:eMail , password: password){[weak self] authResult, error in
            guard self != nil else { return }
            if let e = error{
                    let toast=Toast.text("Wrong password or E-mail!")
                    self!.passwordTextfield.text=""
                print(e.localizedDescription)
                    toast.show()
            }
            else{
                self!.performSegue(withIdentifier: k.loginSegue, sender: self)

            }
            
        }
        
    }
    
}

