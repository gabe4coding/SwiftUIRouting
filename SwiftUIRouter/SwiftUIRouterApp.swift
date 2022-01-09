//
//  SwiftUIRouterApp.swift
//  SwiftUIRouter
//
//  Created by Gabriele Pavanello on 08/01/22.
//

import SwiftUI

@main
struct SwiftUIRouterApp: App {
    var body: some Scene {
        WindowGroup {
            RootView<RootViewRouter>(router:  RootViewRouter(isPresented: .constant(false)))
        }
    }
}
