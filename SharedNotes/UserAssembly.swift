//
//  UserAssembly.swift
//  SharedNotes
//
//  Created by Sergey Petrachkov on 8/29/17.
//  Copyright © 2017 Sergey Petrachkov. All rights reserved.
//

import UIKit

class UserAssembly {
  fileprivate init() {}
  
  static func createModule(for user: User) -> UserViewController {
    let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "User") as! UserViewController
    controller.title = user.firstName
    controller.presenter?.assignUserId(userId: user.userId)
    return controller
  }
}
