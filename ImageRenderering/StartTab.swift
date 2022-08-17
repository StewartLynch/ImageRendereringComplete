//
// Created for ImageRenderering
// by Stewart Lynch on 2022-08-15
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct StartTab: View {
    var body: some View {
            TabView {
                BusinessCard()
                    .tabItem {
                        Label("Business Card", systemImage: "person.text.rectangle.fill")
                    }
                ChartView()
                    .tabItem {
                        Label("Chart", systemImage: "chart.bar.fill")
                    }
            }
    }
}

struct StartTab_Previews: PreviewProvider {
    static var previews: some View {
        StartTab()
    }
}
