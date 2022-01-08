//
//  PresentingRouter.swift
//  SwiftUIRouter
//
//  Created by Gabriele Pavanello on 08/01/22.
//

import Foundation

protocol RootViewRouterInterface: Router {
    func present()
    func push()
}

class RootViewRouter: Router, RootViewRouterInterface {
    func present() {
        let router = Router(isPresented: isSwapped)
        swap(with: DetailView(router: router))
    }
    
    func push() {
        let router = Router(isPresented: isNavigating)
        navigateTo(DetailView(router: router))
    }
}
