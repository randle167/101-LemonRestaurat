//
//  AboutView.swift
//  101-LemonRestaurat
//
//  Created by Ashley Randle on 2/11/26.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        Text("About Little lemon")
            .font(.largeTitle)
            .foregroundColor(.green)
            .bold()
        
        Text("Little lemon is a cozy Mediterranean-inspired restaurant in the heart of downtown Toronto. ")
            .multilineTextAlignment(.center)
            .font(.body)
            .padding()
        
        HStack(spacing: 30){
            Image(systemName: "fork.knife")
            Image(systemName: "leaf")
            Image(systemName: "map")
        }
        .font(.system(size: 40))
        .foregroundColor(.yellow)
    }
}

#Preview {
    AboutView()
}
