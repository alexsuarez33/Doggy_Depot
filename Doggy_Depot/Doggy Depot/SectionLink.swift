//
//  SectionLink.swift
//  Doggy Depot
//

import SwiftUI

struct SectionLink: View {
    var title: String
    var category: String

    var body: some View {
        NavigationLink(destination: CategoryView(category: category)) {
            Text(title)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
        }
    }
}
