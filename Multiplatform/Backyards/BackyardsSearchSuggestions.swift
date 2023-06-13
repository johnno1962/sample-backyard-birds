/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The backyard search suggestions.
*/

import SwiftUI
import SwiftData
import BackyardBirdsData

struct BackyardsSearchSuggestions: View {
    @Query private var backyards: [Backyard]
    
    var events: [BackyardVisitorEvent] {
        Set(backyards.compactMap(\.currentVisitorEvent))
            .sorted { $0.bird.speciesName < $1.bird.speciesName }
    }
    
    var body: some View {
        ForEach(events) { event in
            let backyard = event.backyard.name
            Text("**\(event.bird.speciesName)** is currently in **\(backyard)**")
                .searchCompletion(backyard)
        }
        .eraseToAnyView()
    }

    #if DEBUG
    @ObservedObject var iO = injectionObserver
    #endif
}
