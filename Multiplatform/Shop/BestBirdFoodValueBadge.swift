/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The value badge that is applicable to bird food.
*/

import SwiftUI

private struct BestBirdFoodValueBadge: View {
    
    var body: some View {
        Text("Best Value \(Image(systemName: "sparkles"))", comment: "Bird food label with sparkles icon.")
            .font(.title3.weight(.medium))
            .padding(.vertical, 5)
            .padding(.horizontal)
            .background(.regularMaterial, in: .capsule)
            .overlay {
                Capsule().strokeBorder()
            }
            .foregroundStyle(.premiumBirdFoodColor)
            .dynamicTypeSize(...(.xLarge))
            .fixedSize()
            .offset(y: 10.0)
        .eraseToAnyView()
    }

    #if DEBUG
    @ObservedObject var iO = injectionObserver
    #endif
    
}

extension View {
    
    func bestBirdFoodValueBadge() -> some View {
        overlay(alignment: .bottom) {
            BestBirdFoodValueBadge()
        }
    }
    
}

#Preview {
    BestBirdFoodValueBadge()
}
