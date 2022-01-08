//
//  PresentingRouter.swift
//  SwiftUIRouter
//
//  Created by Gabriele Pavanello on 08/01/22.
//

import Foundation
import SwiftUI

protocol RootViewRouterInterface: Router {
    func present(namespace: Namespace.ID)
}

class RootViewRouter: Router, RootViewRouterInterface {
    func present(namespace: Namespace.ID) {
        let router = Router(isPresented: isSwapped)
        swap(with: DetailView(router: router, namespace: namespace))
    }
}
