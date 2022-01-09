//
//  Namespace.swift
//  SwiftUIRouter
//
//  Created by Gabriele Pavanello on 09/01/22.
//

import Foundation
import SwiftUI

protocol NamespacedView: View {
    var namespace: Namespace.ID! { get }
}

struct NamespaceEnvironmentKey: EnvironmentKey {
    static var defaultValue: Namespace.ID? = nil
}

extension EnvironmentValues {
    var namespace: Namespace.ID? {
        get { self[NamespaceEnvironmentKey.self] }
        set { self[NamespaceEnvironmentKey.self] = newValue }
    }
}

extension View {
    func namespace(_ value: Namespace.ID) -> some View {
        environment(\.namespace, value)
    }
}
