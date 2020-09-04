//
//  AdaptiveStack.swift
//  Weatherly
//
//  Created by Martin Ivančo on 04/09/2020.
//  Copyright © 2020 Martin Ivančo. All rights reserved.
//

import SwiftUI

struct AdaptiveStack<Content: View>: View {
    @Environment(\.verticalSizeClass) var sizeClass
    let horizontalAlignment: HorizontalAlignment
    let verticalAlignment: VerticalAlignment
    let spacing: CGFloat?
    let content: () -> Content

    init(horizontalAlignment: HorizontalAlignment = .center, verticalAlignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.content = content
    }

    var body: some View {
        Group {
            if sizeClass == .regular {
                VStack(alignment: horizontalAlignment, spacing: spacing, content: content)
            } else {
                HStack(alignment: verticalAlignment, spacing: spacing, content: content)
            }
        }
    }
}

struct AdaptiveStack_Previews: PreviewProvider {
    static var previews: some View {
        AdaptiveStack {
            Text("Item 1")
            Text("Item 2")
            Text("Item 3")
        }
    }
}
