import UIKit

protocol NewEditMemberViewControllerDelegate {
  func addMember(email: String, completion: @escaping (_ success: Bool) -> Void)
}




class NewEditMemberViewController: UIViewController {

  
  // MARK: Properties
  
  var delegate: NewEditMemberViewControllerDelegate?
  
  @IBOutlet weak var emailTextField: UITextField!
  
  // MARK: UIViewController methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    emailTextField.delegate = self
  }
  
  // MARK: Actions
  
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIButton) {
        if let email = emailTextField.text {
            delegate?.addMember(email: email) { (success: Bool) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    // NOTE: Alert the user for unsuccessful search of user
                }
            }
            showSpinner()
        } else {
            // NOTE: Alert the user for missing email of the new user
        }
    }
    
  
  // MARK: Private helper methods
  
  private func showSpinner() {
    let spinner = UIActivityIndicatorView(style: .gray)
    spinner.translatesAutoresizingMaskIntoConstraints = false
    spinner.startAnimating()
    view.addSubview(spinner)
    spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }
}


extension NewEditMemberViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        return true
    }
}
