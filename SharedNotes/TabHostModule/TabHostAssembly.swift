//
//  TabHostAssembly.swift
//  SharedNotes
//
//  Created by Sergey Petrachkov on 8/29/17.
//  Copyright © 2017 Sergey Petrachkov. All rights reserved.
//

import UIKit

class TabHostAssembly {
  fileprivate init() {}
  
  static func createModule(user: User) -> TabHostViewController {
    let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabHost")
    
    let userController = UserAssembly.createModule(for: user)
    controller.addChildViewController(userController)
    return controller as! TabHostViewController
  }
}
