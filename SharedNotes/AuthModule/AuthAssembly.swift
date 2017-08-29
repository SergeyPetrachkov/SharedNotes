//
//  AuthAssembly.swift
//  SharedNotes
//
//  Created by Sergey Petrachkov on 8/29/17.
//  Copyright © 2017 Sergey Petrachkov. All rights reserved.
//

import UIKit

class AuthAssembly {
  fileprivate init() {}
  static func createModule() -> AuthViewController {
    return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AuthVC") as! AuthViewController
  }
}
