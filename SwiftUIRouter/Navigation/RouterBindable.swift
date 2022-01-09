//
//  RouterBindable.swift
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
