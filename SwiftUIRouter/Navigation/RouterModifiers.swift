//
//  RouteModifiers.swift
//  SwiftUIRouter
//
//  Created by Gabriele Pavanello on 08/01/22.
//

import Foundation
import SwiftUI

struct NavigationModifier: ViewModifier {
    @Binding var presentingView: AnyView?
    
    func body(content: Content) -> some View {
        content.background(
            NavigationLink(destination: self.presentingView, isActive: Binding(
                get: { self.presentingView != nil },
                set: {
                    if !$0 {
                        self.presentingView = nil
                    }
                })) {
                    EmptyView()
                }
        )
    }
}

struct SheetModifier: ViewModifier {
    @Binding var presentingView: AnyView?
    
    func body(content: Content) -> some View {
        content.sheet(isPresented: Binding(
            get: { self.presentingView != nil },
            set: {
                if !$0 {
                    self.presentingView = nil
                }
            })) {
            self.presentingView
        }
    }
}

struct TopViewModifier: ViewModifier {
    @Binding var presentingView: AnyView?
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if presentingView != nil {
                self.presentingView
            }
        }
    }
}

struct SwapViewModifier: ViewModifier {
    @Binding var presentingView: AnyView?
    
    func body(content: Content) -> some View {
        if presentingView != nil {
            self.presentingView
        } else {
            content
        }
    }
}
