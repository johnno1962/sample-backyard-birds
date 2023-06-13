/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The bird, composed of its parts.
*/

import BackyardBirdsData
import SwiftUI
//import HotSwiftUI


public struct ComposedBird: View {
    var bird: Bird
    var direction: HorizontalEdge
    
    public init(bird: Bird, direction: HorizontalEdge = .leading) {
        self.bird = bird
        self.direction = direction
    }
    
    public var body: some View {
        ZStack {
            ForEach(bird.species.parts) { part in
                if part.flipbookFrameCount != nil {
                    let i = 0
                    Image("\(bird.species.id)/\(part.name)\(i + 1)", bundle: .module)
                        .resizable()
                        .scaledToFit()
                        .colorMultiply(bird.colors.colorData(for: part.colorStyle).color)
                } else {
                    Image("\(bird.species.id)/\(part.name)", bundle: .module)
                        .resizable()
                        .scaledToFit()
                        .colorMultiply(bird.colors.colorData(for: part.colorStyle).color)
                }
            }
        }
        .scaleEffect(x: direction == .trailing ? 1 : -1)
        .flipsForRightToLeftLayoutDirection(true)
        .id(bird.id)
//        .eraseToAnyView()
    }

    #if DEBUG
//    @ObservedObject var iO = injectionObserver
    #endif
    
    func frameIndex(date: Date, frameCount: Int) -> Int {
        let totalSeconds = date.timeIntervalSince1970
        let duration = TimeInterval(frameCount) * 0.1
        let seconds = totalSeconds.truncatingRemainder(dividingBy: duration)
        let progress = seconds / duration
        let frame = Int(floor(progress * Double(frameCount)))
        return frame
    }
}

#Preview {
    ModelPreview { bird in
        ComposedBird(bird: bird)
    }
}
