//
//  Router.swift
//  SwiftUIRouter
//
//  Created by Gabriele Pavanello on 08/01/22.
//

import Foundation
import SwiftUI

protocol RouterBindable {
    associatedtype RouterObject: Router
    var router: RouterObject { get }
    
    init(router: RouterObject)
}

class Router: ObservableObject {
    struct State {
        var navigating: AnyView? = nil
        var presentingSheet: AnyView? = nil
        var topView: AnyView? = nil
        var swapView: AnyView? = nil
        var isPresented: Binding<Bool>
    }
    
    @Namespace var namespace
    @Published private(set) var state: State
    
    init(isPresented: Binding<Bool>) {
        state = State(isPresented: isPresented)
    }
}

extension Router {
    func navigateTo<V: View>(_ view: V) {
        state.navigating = AnyView(view)
    }
    
    func presentSheet<V: View>(_ view: V) {
        state.presentingSheet = AnyView(view)
    }
    
    func onTop<V: View>(_ view: V) {
        state.topView = AnyView(view)
    }
    
    func swap<V: View>(with view: V) {
        withAnimation(.easeInOut(duration: 0.5)) {
            state.swapView = AnyView(view)
        }
    }
    
    func dismiss() {
        state.isPresented.wrappedValue = false
    }
}

extension Router {
    var isNavigating: Binding<Bool> {
        boolBinding(keyPath: \.navigating)
    }
    
    var isPresentingSheet: Binding<Bool> {
        boolBinding(keyPath: \.presentingSheet)
    }
    
    var isOnTopView: Binding<Bool> {
        boolBinding(keyPath: \.topView)
    }
    
    var isSwapped: Binding<Bool> {
        boolBinding(keyPath: \.swapView)
    }
    
    var isPresented: Binding<Bool> {
        state.isPresented
    }
}

private extension Router {
    func binding<T>(keyPath: WritableKeyPath<State, T>) -> Binding<T> {
        Binding {
            self.state[keyPath: keyPath]
        } set: {
            self.state[keyPath: keyPath] = $0
        }
    }
    
    func boolBinding<T>(keyPath: WritableKeyPath<State, T?>) -> Binding<Bool> {
        Binding {
            self.state[keyPath: keyPath] != nil
        } set: {
            if !$0 {
                self.state[keyPath: keyPath] = nil
            }
        }
    }
}

extension View {
    func navigation(_ router: Router) -> some View {
        self.modifier(NavigationModifier(presentingView: router.binding(keyPath: \.navigating)))
    }
    
    func sheet(_ router: Router) -> some View {
        self.modifier(SheetModifier(presentingView: router.binding(keyPath: \.presentingSheet)))
    }
    
    func top(_ router: Router) -> some View {
        self.modifier(TopViewModifier(presentingView: router.binding(keyPath: \.topView)))
    }
    
    func swap(_ router: Router) -> some View {
        self.modifier(SwapViewModifier(presentingView: router.binding(keyPath: \.swapView)))
    }
}
