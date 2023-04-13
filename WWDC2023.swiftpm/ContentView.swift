import SwiftUI
import SpriteKit

struct ContentView: View {
    var body: some View {
        SpriteView(scene: MenuScene.newScene())
            .statusBar(hidden: true)
            .ignoresSafeArea()
    }
}
