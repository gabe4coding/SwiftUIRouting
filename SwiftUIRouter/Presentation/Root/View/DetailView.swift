//
//  DetailView.swift
//  SwiftUIRouter
//
//  Created by Gabriele Pavanello on 08/01/22.
//

import Foundation
import SwiftUI

struct DetailView<R: Router>: NamespacedView, RouterBindable {
    
    internal var router: R
    
    @State var appear: Bool = false
    @Environment(\.namespace) var namespace: Namespace.ID!
    
    init(router: R) {
        self.router = router
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            if appear {
                RoundedRectangle(cornerRadius: 15.0, style: .continuous)
                    .fill(.gray.opacity(0.5))
                    .frame(height:200)
                    .transition(.scale.combined(with: .opacity))
            }
            ZStack {
                Text("Root")
                    .matchedGeometryEffect(id: Constants.matchedLabelGeometry, in: namespace)
                    .font(.system(size: 30))
            }
            .padding()
        }
        .padding()
        .onAppear {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                self.appear.toggle()
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.2, dampingFraction: 0.9)) {
                self.appear.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.router.dismiss()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(router: Router(isPresented: .constant(true)))
    }
}
