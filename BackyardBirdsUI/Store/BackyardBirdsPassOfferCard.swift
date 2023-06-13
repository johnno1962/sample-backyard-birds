/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The Backyard Birds Pass offer card view.
*/

import SwiftUI
import SwiftData
import BackyardBirdsData
import LayeredArtworkLibrary

struct BackyardBirdsPassOfferCard: View {
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Backyard Birds Pass")
                BirdDecoration()
            }
        }
        .frame(maxWidth: .infinity)
//        .eraseToAnyView()
    }

    #if DEBUG
//    @ObservedObject var iO = injectionObserver
    #endif
}

private let tagValue = BirdTag.premiumGoldenHummingbird.rawValue

struct BirdDecoration: View {
    @Query(filter: #Predicate { $0.tag == tagValue })
    private var birds: [Bird]

    var body: some View {
        if let bird = birds.first {
            ComposedBird(bird: bird, direction: .leading)
                .frame(width: 50, height: 50)
        }
    }
    
}
