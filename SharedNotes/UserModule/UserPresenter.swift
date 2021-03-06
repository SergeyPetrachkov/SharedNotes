//
//  UserPresenter.swift
//  SharedNotes
//
//  Created by Sergey Petrachkov on 8/29/17.
//  Copyright (c) 2017 Sergey Petrachkov. All rights reserved.
//
//  This file was generated by the Actonica VIPER Xcode Templates so
//  you can apply VIPER architecture to your iOS projects.
//

import UIKit

protocol UserPresenterInput {
  var viewModel : UserModule.Context.ViewModel? { get set }
  func start()
  
  func assignUserId(userId: String)
  
  func logOut()
}
protocol UserPresenterOutput {
  func didChangeState(viewModel : UserModule.Context.ViewModel)
}

class UserPresenter: UserPresenterInput {
  //MARK: - Essentials
  var view: UIViewController!
  var output : UserPresenterOutput?
  var viewModel : UserModule.Context.ViewModel? {
    didSet{
      guard let viewModel = self.viewModel else {
        return
        //or do something else like show placeholder
      }
      self.output?.didChangeState(viewModel: viewModel)
    }
  }
  var userRequest : UserModule.Context.Request?
  let router : UserRoutingLogic = UserRouter()
  var interactor : UserInteractorInput = UserInteractor()
  //MARK: - Initializers
  fileprivate init() {
    
  }
  
  convenience init(view: UIViewController, output: UserPresenterOutput) {
    self.init()
    self.view = view
    self.output = output
    self.interactor.output = self
  }
  
  // MARK: - Presenter Input
  func start() {
    guard let request = self.userRequest else {
      return
    }
    
    self.interactor.getUserInfo(request: request)
  }
  func logOut() {
    self.interactor.logout()
  }
  func assignUserId(userId: String) {
    self.userRequest = UserModule.Context.Request(userId: userId)
  }
}
extension UserPresenter : UserInteractorOutput {
  //MARK: - Interactor output
  func didWipeOut() {
    self.router.logOut()
  }
  
  func didFail(with error: Error){
  }
  
  func didReceive(user: User) {
    self.viewModel = UserModule.Context.ViewModel(user: user)
  }
}
