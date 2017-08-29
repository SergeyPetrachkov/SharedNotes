//
//  AuthViewController.swift
//  SharedNotes
//
//  Created by Sergey Petrachkov on 8/29/17.
//  Copyright (c) 2017 Sergey Petrachkov. All rights reserved.
//
//  This file was generated by the Actonica VIPER Xcode Templates so
//  you can apply VIPER architecture to your iOS projects.
//

import UIKit
import Bond
import ReactiveKit

class AuthViewController: UIViewController {
  //MARK: - UI properties
  
  @IBOutlet weak var firstnameTextField: UITextField!
  @IBOutlet weak var lastnameTextField: UITextField!
  @IBOutlet weak var submitButton: UIButton!
  //MARK: - Essentials
  var presenter : AuthPresenterInput?

  // MARK: Initializers
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: - Setup
  private func setup() {
    self.presenter = AuthPresenter(view: self, output: self)
  }
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    combineLatest(self.firstnameTextField.reactive.text, self.lastnameTextField.reactive.text) {
      first, last  in
      guard let first = first, let last = last else { return false }
      return first.characters.count > 0 && last.characters.count > 0
    }.bind(to: submitButton.reactive.isEnabled)
  }
  // MARK: - Actions
  @IBAction func submitTouchedUpInside(_ sender: Any) {
    guard let firstname = self.firstnameTextField.text,
          let lastname = self.lastnameTextField.text, firstname != "", lastname != ""
    else {
      return
    }
    
    self.presenter?.submitForm(firstnameValue: firstname, lastnameValue: lastname)
  }
}
extension AuthViewController : AuthPresenterOutput {
  func didChangeState(viewModel : Auth.Context.ViewModel){
    
  }
}
