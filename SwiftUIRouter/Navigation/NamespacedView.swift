//
//  NamespacedView.swift
//  SwiftUIRouter
//
//  Created by Gabriele Pavanello on 08/01/22.
//

import Foundation
import SwiftUI

protocol NamespacedView: View {
    var namespace: Namespace.ID { get }
}
