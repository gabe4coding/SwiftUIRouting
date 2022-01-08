//
//  DetailView.swift
//  SwiftUIRouter
//
//  Created by Gabriele Pavanello on 08/01/22.
//

import Foundation
import SwiftUI

struct DetailView<R: Router>: View, RouterBindable {
    
    internal var router: R
    
    @State var appear: Bool = false
    
    init(router: R) {
        self.router = router
    }
    
    var body: some View {
        ZStack {
            if appear {
                RoundedRectangle(cornerRadius: 15.0, style: .continuous)
                    .fill(.red)
                    .padding()
                    .frame(height:200)
                    .transition(.scale.combined(with: .opacity))
                
                Text("Detail").onTapGesture {
                    withAnimation(.spring(response: 0.2, dampingFraction: 0.7)) {
                        self.appear.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        self.router.dismiss()
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05, execute: {
                withAnimation(.spring(response: 0.2, dampingFraction: 0.7)) {
                    self.appear.toggle()
                }
            })
        }
    }
}
