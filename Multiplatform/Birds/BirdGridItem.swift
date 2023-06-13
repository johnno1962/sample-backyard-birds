/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The bird grid item.
*/

import SwiftUI
import SwiftData
import BackyardBirdsData
import BackyardBirdsUI

struct BirdGridItem: View {
    var bird: Bird
    
    var body: some View {
        VStack {
            BirdIcon(bird: bird, insets: 10)
                .padding(.horizontal, 10)
            
            VStack {
                Text(bird.speciesName)
                    .font(.callout)
                Text(bird.visitStatus.title)
                    .foregroundStyle(.secondary)
                    .font(.caption)
            }
            .multilineTextAlignment(.center)
        }
        .eraseToAnyView()
    }

    #if DEBUG
    @ObservedObject var iO = injectionObserver
    #endif
}

#Preview {
    ModelPreview { bird in
        BirdGridItem(bird: bird)
    }
}
