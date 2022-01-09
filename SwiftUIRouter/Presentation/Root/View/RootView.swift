//
//  ContentView.swift
//  SwiftUIRouter
//
//  Created by Gabriele Pavanello on 08/01/22.
//

import SwiftUI

struct Constants {
    static let matchedLabelGeometry = "label"
    static let matchedColorGeometry = "color"
}

struct RootView<R: RootViewRouterInterface>: View, RouterBindable {
    @Namespace internal var namespace

    internal var router: R
    
    init(router: R) {
        self.router = router
    }

    var body: some View {
        ZStack {
            ZStack {
                Text("Root")
                    .matchedGeometryEffect(id: Constants.matchedLabelGeometry, in: namespace)
                    .font(.system(size: 30))
            }
            .padding()
        }
        .onTapGesture {
            router.present()
        }
        .swap(router, namespace: namespace)
    }
}

struct PresentingView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(router: RootViewRouter(isPresented: .constant(false)))
    }
}


