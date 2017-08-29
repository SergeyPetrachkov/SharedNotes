//
//  NotesAssembly.swift
//  SharedNotes
//
//  Created by Sergey Petrachkov on 8/29/17.
//  Copyright © 2017 Sergey Petrachkov. All rights reserved.
//

import UIKit

class NotesAssembly {
  fileprivate init() {}
  
  static func createModule() -> NotesViewController {
    let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Notes") as! NotesViewController
    controller.title = "Notes"
    return controller
  }
}
