//
//  NotesPresenter.swift
//  SharedNotes
//
//  Created by Sergey Petrachkov on 8/29/17.
//  Copyright (c) 2017 Sergey Petrachkov. All rights reserved.
//
//  This file was generated by the Actonica VIPER Xcode Templates so
//  you can apply VIPER architecture to your iOS projects.
//

import UIKit

protocol NotesPresenterInput {
  func presentSomething()
}
protocol NotesPresenterOutput {
  func didChangeState(viewModel : Notes.Something.ViewModel)
}

class NotesPresenter: NotesPresenterInput
{
  //MARK: - Essentials
  var view: UIViewController!
  var output : NotesPresenterOutput?
  var viewModel : Notes.Something.ViewModel? {
    didSet{
      guard let viewModel = self.viewModel else {
        return
        //or do something else like show placeholder
      }
      self.output?.didChangeState(viewModel: viewModel)
    }
  }
  let router : NotesRoutingLogic = NotesRouter()
  var interactor : NotesInteractorInput = NotesInteractor()
  //MARK: - Initializers
  fileprivate init() {
    
  }
  
  convenience init(view: UIViewController, output: NotesPresenterOutput) {
    self.init()
    self.view = view
    self.output = output
    self.interactor.output = self
  }
  
  // MARK: - Presenter Input
  func presentSomething()
  {
    // ask router to navigate somewhere or ask interactor for resources... it's up to you
    // like:
    // let requestParams = RequestParams()
    // self.interactor.getSomeData(requestParams: requestParams)
    // or:
    // let routingParams = RoutingParams(firstValue : self.viewModel.firstValue, secondValue: self.viewModel.secondValue)
    // self.router.showNextModule(from: self.view, with: routingParams)
  }
}
extension NotesPresenter : NotesInteractorOutput {
  //MARK: - Interactor output
  func didReceive(some data: Any){
    // Process it and act accordingly like:
    // self.output?.didChangeState(viewModel : )
  }
  func didFail(with error: Error){
//    self.router.showError(error: error)
  }
}
