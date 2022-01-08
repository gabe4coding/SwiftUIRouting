//
//  ContentView.swift
//  SwiftUIRouter
//
//  Created by Gabriele Pavanello on 08/01/22.
//

import SwiftUI

struct RootView<R: RootViewRouterInterface>: View {
    @EnvironmentObject internal var router: R
    
    var body: some View {
        NavigationView {
            Text("Root")
                .onTapGesture {
                    router.present()
                }.onLongPressGesture(perform: {
                    router.push()
                })
                .swap(router)
        }
    }
}

struct PresentingView_Previews: PreviewProvider {
    static var previews: some View {
        RootView<RootViewRouter>().environmentObject(RootViewRouter(isPresented: .constant(false)))
    }
}


